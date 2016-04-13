require 'rails_helper'

feature 'admin can view things' do
  let!(:admin)  { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin)  { FactoryGirl.create(:user) }
  let!(:api1)  do
    FactoryGirl.create(:api, user: admin,
    url: 'www.apiaddict.xyz/api')
  end
  scenario 'admin can view a list of apis' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link 'Apis'

    expect(page).to have_content(api1.name)
  end

  scenario 'admin can view a list of users' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link 'Users'

    expect(page).to have_content(admin.first_name)
  end

  scenario 'non admin can not access admin page' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: non_admin.email
    fill_in 'Password', with: non_admin.password
    click_button 'Sign In'

    visit admin_root_path
    expect(page).to have_content("Not authorized")
  end
end
