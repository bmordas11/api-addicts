require "rails_helper"
feature 'sign up' do
  scenario 'Provided signup information is valid' do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: 'Guy'
    fill_in 'Last Name', with: 'Guyson'
    fill_in 'Email', with: "dude@dude.com"
    fill_in 'user_password', with: "password"
    fill_in 'Password Confirmation', with: "password"

    click_button 'Sign Up'
    expect(page).to have_content("Sign up successful!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'Provided signup information is invalid' do
    visit root_path

    click_link 'Sign Up'

    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'passwords do not match' do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: 'Guyson'
    fill_in 'Email', with: "dude"
    fill_in 'user_password', with: "password"
    fill_in 'Password Confirmation', with: "drowssap"
    
    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
