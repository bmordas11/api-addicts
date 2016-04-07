require "rails_helper"

feature "user adds a new api with tags" do
  scenario "successfully adds a api with tags" do
    visit root_path

    click_link "Add New"
    fill_in("Name", with: "apiai")
    fill_in("URL", with: "www.api.ai")
    fill_in("Description", with: "Right side of Gabby's brain.")
    choose("Yes.")
    fill_in("Tags", with: "Artificial Intelligence,Voice Processing")

    click_button "Create API"
    api = Api.where(name: "apiai").first

    expect(api.tags.first.name).to eq("Artificial Intelligence")
    expect(api.tags.second.name).to eq("Voice Processing")
  end

  scenario "adds api with no tags" do
    visit root_path
    click_link "Add New"

    fill_in("Name", with: "apiai")
    fill_in("URL", with: "www.api.ai")
    fill_in("Description", with: "Right side of Gabby's brain.")
    choose("Yes.")
    fill_in("Tags", with: "")

    click_button "Create API"
    api = Api.where(name: "apiai").first

    expect(api.tags.first).to  be(nil)
  end

  scenario "Tags successfully display on show page" do
    visit root_path
    click_link "Add New"

    fill_in("Name", with: "apiai")
    fill_in("URL", with: "www.api.ai")
    fill_in("Description", with: "Right side of Gabby's brain.")
    choose("Yes.")
    fill_in("Tags", with: "rubberduck,bumblebee")

    click_button "Create API"
    api = Api.where(name: "apiai").first

    expect(page).to have_content("rubberduck")
    expect(page).to have_content("bumblebee")
  end
end
