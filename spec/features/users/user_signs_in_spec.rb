require 'rails_helper'

feature 'user signs in' do
  let(:user1) { FactoryGirl.create(:user) }
  scenario 'provides valid credentials, successfully signs in' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provides invalid credentials, sees error message' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: 'something@some.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign In'
    expect(page).to_not have_content('Welcome Back')
    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'already signed in user is unable to sign in again' do
    visit new_user_session_path
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Sign In'
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end
end
