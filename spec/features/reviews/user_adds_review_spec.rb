require 'rails_helper'

feature 'user adds a new review' do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:api1)  { FactoryGirl.create(:api, user: user) }
  let!(:api2)  { FactoryGirl.create(:api, user: user, paid: true) }

  scenario 'successfully adds API review' do
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
  end

  scenario 'unsuccessful API review attempted (rating missing)' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit apis_path
    click_link api1.name

    fill_in 'Body', with: 'This is the best API ever!'

    click_button 'Add Review'
    expect(page).to have_content('Rating is not included in the list.')
    expect(page).to have_content('Review Not Submitted')
  end

  scenario 'unsuccessful API review attempted (body missing)' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit apis_path
    click_link api1.name

    choose('2')

    click_button 'Add Review'
    expect(page).to have_content("Body can't be blank.")
    expect(page).to have_content('Review Not Submitted')
  end
end
