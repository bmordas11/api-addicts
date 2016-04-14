require 'rails_helper'

feature 'user signs out' do
  let(:user2) { FactoryGirl.create(:user) }
  scenario 'authenticated user successfuly Signs Out' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Sign In'

    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
    expect(page).to_not have_content('Sign Out')
  end
end
