require 'rails_helper'

feature "User can edit his own api post if authenticated" do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "user successfuly edits a api " do
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

    visit apis_path
    click_link("Absolutely not your Average API")

    expect(page).to have_content('Absolutely not your Average API')

    click_on "Edit Your Api"
    fill_in('Name', with: 'This is testing if it is edited')
    fill_in('URL', with: 'www.yahoo.com/23000hh0ahfsdha')
    fill_in('Description', with: 'Yahoo thing.')
    choose('Yes.')
    click_on("Update API")

    expect(page).to have_content("This is testing if it is edited")
    expect(page).to have_content("Api Updated!")
  end
end
