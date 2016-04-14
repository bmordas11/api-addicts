require 'rails_helper'

feature 'user can view an API show page' do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:api1)  { FactoryGirl.create(:api, user: user) }
  let!(:api2)  { FactoryGirl.create(:api, user: user, paid: true) }

  scenario 'sees an api list for free API' do
    visit apis_path
    click_link api1.name

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api1.url)
    expect(page).to have_content(api1.description)
  end

  scenario 'sees an api list for not free API' do
    visit apis_path
    click_link api2.name

    expect(page).to have_content(api2.name)
    expect(page).to have_content(api2.url)
    expect(page).to have_content(api2.description)
  end
end
