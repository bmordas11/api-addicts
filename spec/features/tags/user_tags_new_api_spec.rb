require 'rails_helper'

feature 'user posts new api with tags' do
  let!(:user1) { FactoryGirl.create(:user) }
  scenario 'successfully adds an api with tags' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    visit root_path
    click_link 'Add New'
    fill_in('Name', with: 'apiai')
    fill_in('URL', with: 'www.api.ai')
    fill_in('Description', with: "Right side of Gabby's brain.")
    choose('Yes.')
    fill_in('Tags', with: 'Artificial Intelligence,Voice Processing')
    click_button 'Create API'

    expect(page).to have_content('New API Created!')
  end

  scenario 'successfully posts new api with no tags' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit root_path

    click_link 'Add New'
    fill_in('Name', with: 'apiai')
    fill_in('URL', with: 'www.api.ai')
    fill_in('Description', with: "Right side of Gabby's brain.")
    choose('Yes.')
    fill_in('Tags', with: '')
    click_button 'Create API'

    expect(page).to have_content('New API Created!')
    expect(page).to have_content("apiai")
  end

  scenario 'views tags on api show page' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    visit root_path

    click_link 'Add New'
    fill_in('Name', with: 'apiai')
    fill_in('URL', with: 'www.api.ai')
    fill_in('Description', with: "Right side of Gabby's brain.")
    choose('Yes.')
    fill_in('Tags', with: 'rubberduck,bumblebee')
    click_button 'Create API'

    expect(page).to have_content('rubberduck')
    expect(page).to have_content('bumblebee')
    expect(page).to have_content('New API Created!')

  end
end
