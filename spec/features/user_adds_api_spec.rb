require "rails_helper"

# [ ] I want to add a new API So others can see and review it

feature "user adds a new api" do
  let!(:api1) { Api.create(name: "Weather API for Noobs", url: "www.wunderground.com/something123456789",
    paid: false, description: "This is a sweet weather API that shows people the weather.")
  }

  scenario "can add an api to the website" do
    visit root_path
    click_link "Add New"

    expect(page).to have_content("Name")
    expect(page).to have_content("URL")
    expect(page).to have_content("Description")
    expect(page).to have_content("Paid?")
  end

  scenario "successfully adds a paid api" do
    visit root_path
    click_link "Add New"

    fill_in("Name", with: "Absolutely not your Average API")
    fill_in("URL", with: "www.yahoo.com/23000hh0ahfsdha")
    fill_in("Description", with: "Yahoo thing.")
    choose("Yes.")
  end

  scenario "successfully adds a free api" do
    visit root_path
    click_link "Add New"

    fill_in("Name", with: "Penguins")
    fill_in("URL", with: "www.somefreething.com/ir03n4020202020")
    fill_in("Description", with: "Stuff about penguins.")
    choose("No.")
  end
end
