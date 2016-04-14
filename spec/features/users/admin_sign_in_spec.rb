require 'rails_helper'

feature 'admin signs in' do
  let(:admin1) { FactoryGirl.create(:user, admin: true) }
    scenario 'provides valid credentials, successfully signs in as Admin' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: admin1.email
    fill_in 'Password', with: admin1.password

    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Admin Dashboard')
  end
end
