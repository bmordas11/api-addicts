require 'rails_helper'

feature 'admin can edit things' do
  let!(:admin)  { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin)  { FactoryGirl.create(:user) }
  let!(:api1)  do
    FactoryGirl.create(:api, user: non_admin,
    url: 'www.apiaddict.xyz/api')
  end
  scenario 'admin can edit a user' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link('Users')
    first(:link, "Edit").click

    fill_in 'Email', with: "paul@paul.com"
    click_button "Update User"

    expect(page).to have_content("paul@paul.com")
  end

  scenario 'admin can edit a api' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link('Apis')
    first(:link, "Edit").click

    fill_in 'Name', with: "super sweet api"
    click_button "Update Api"

    expect(page).to have_content("super sweet api")
  end
end
