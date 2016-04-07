require "rails_helper"

# [x] I want to visit the API index page so I can see what APIs there are

feature "user can view a list of apis" do
  let!(:api1) { FactoryGirl.create(:api) }
  let!(:api2) { FactoryGirl.create(:api) }
  
  scenario "user sees an api list" do
    visit apis_path

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api1.url)
    expect(page).to have_content(api2.name)
    expect(page).to have_content(api2.url)
  end
end
