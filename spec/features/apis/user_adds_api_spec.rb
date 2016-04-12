require 'rails_helper'

feature 'user adds a new api' do
  let!(:user) { FactoryGirl.create(:user) }

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

    fill_in('Name', with: 'Absolutely not your Average API')
    fill_in('URL', with: 'www.yahoo.com/23000hh0ahfsdha')
    fill_in('Description', with: 'Yahoo thing.')
    choose('Yes.')
    click_button 'Create API'
    expect(page).to have_content('Absolutely not your Average API')
    expect(page).to have_content('www.yahoo.com/23000hh0ahfsdha')
    expect(page).to have_content('Yahoo thing.')
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

    fill_in('Name', with: 'Penguins')
    fill_in('URL', with: 'www.somefreething.com/ir03n4020202020')
    fill_in('Description', with: 'Stuff about penguins.')
    choose('No.')
    click_button 'Create API'
    expect(page).to have_content('Penguins')
    expect(page).to have_content('www.somefreething.com/ir03n4020202020')
    expect(page).to have_content('Stuff about penguins.')
    expect(page).to have_content('This API is free!')
  end
end
