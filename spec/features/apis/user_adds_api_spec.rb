require 'rails_helper'

# USER STORY:
# As an authenticated user
# I want to add a new API
# So others can see and review it

feature 'user adds a new api' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:api)  { FactoryGirl.create(:api, user: user) }

  scenario 'can add an api to the website' do
    visit apis_path
    click_link 'Add New'
    expect(page).to have_field('Name')
    expect(page).to have_field('URL')
    expect(page).to have_field('Description')
    expect(page).to have_content('Paid?')
    expect(page).to have_field('api_paid_true', type: 'radio')
    expect(page).to have_field('api_paid_false', type: 'radio')
  end

  scenario 'successfully adds a paid api' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit root_path
    click_link 'Add New'

    fill_in('Name', with: 'Maps API')
    fill_in('URL', with: 'http://google.com/maps/api')
    fill_in('Description', with: 'Best maps API around!')
    choose('Yes.')
    click_button 'Create API'
    expect(page).to have_content('Maps API')
    expect(page).to have_content('http://google.com/maps/api')
    expect(page).to have_content('Best maps API around!')
    expect(page).to have_content('This API is not free! (It costs money)')
  end

  scenario 'successfully adds a free api' do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit root_path
    click_link 'Add New'

    fill_in('Name', with: 'Even Better API')
    fill_in('URL', with: 'www.api-addicts.com/users')
    fill_in('Description', with: 'This API is Greater!')
    choose('No.')
    click_button 'Create API'
    expect(page).to have_content('Even Better API')
    expect(page).to have_content('www.api-addicts.com/users')
    expect(page).to have_content('This API is Greater!')
    expect(page).to have_content('This API is free!')
  end
end
