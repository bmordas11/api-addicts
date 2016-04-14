require 'rails_helper'

feature 'user can edit a review' do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:api1)  { FactoryGirl.create(:api, user: user) }
  let!(:api2)  { FactoryGirl.create(:api, user: user, paid: true) }

  scenario 'successfully updates review' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit apis_path
    click_link(api1.name)

    fill_in 'Body', with: 'This is the best weather API ever!'
    expect(page).to have_content('Rating')
    choose('4')
    click_button 'Add Review'
    expect(page).to have_content('This is the best weather API ever!')
    expect(page).to have_content('4')
    expect(page).to have_content('Review Submitted!')
    expect(page).to have_content('Edit Your Review')

    click_on 'Edit Your Review'
    fill_in 'Body', with: 'This is testing review update!'
    expect(page).to have_content('Rating')
    choose('3')
    click_button 'Add Review'
    expect(page).to have_content('Review Updated!')
  end
end
