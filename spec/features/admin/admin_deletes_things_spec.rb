require 'rails_helper'

feature 'admin can delete things' do
  let!(:admin)  { FactoryGirl.create(:user, admin: true) }
  let!(:non_admin)  { FactoryGirl.create(:user) }
  let!(:api1)  do
    FactoryGirl.create(:api, user: admin,
    url: 'www.apiaddict.xyz/api')
  end
  scenario 'admin can delete an api' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link 'Apis'
    click_link 'Destroy'

    expect(page).to_not have_content(api1.name)
  end

  scenario 'admin can delete a user' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    visit admin_root_path
    click_link 'Users'
    first(:link, "Destroy").click

    expect(page).to_not have_content(non_admin.id)
  end
end
