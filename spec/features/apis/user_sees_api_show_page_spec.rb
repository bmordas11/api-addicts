require 'rails_helper'

# USER STORY:
# As an authenticated user
# I want to visit an API show page
# So I can review it

feature 'user can view an API show page' do
  let!(:user)  { FactoryGirl.create(:user, id: 1) }
  let!(:api1)  { FactoryGirl.create(:api, user_id: 1) }
  let!(:api2)  { FactoryGirl.create(:api, user_id: 1, paid: true) }

  scenario 'sees an api list for free API' do
    visit apis_path
    click_link api1.name

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api1.url)
    expect(page).to have_content(api1.description)
    expect(page).to have_content('This API is free!')
  end

  scenario 'sees an api list for not free API' do
    visit apis_path
    click_link api2.name

    expect(page).to have_content(api2.name)
    expect(page).to have_content(api2.url)
    expect(page).to have_content(api2.description)
    expect(page).to have_content('This API is not free! (It costs money)')
  end
end
