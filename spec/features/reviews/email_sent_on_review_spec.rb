require "rails_helper"

feature "user that made api is emailed on a new review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:api)  { FactoryGirl.create(:api, user: user) }

  scenario "the test-case user is successfully emailed" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit apis_path
    click_link api.name

    fill_in 'Body', with: 'Some kind of wonderful.'
    choose("5")
    click_button 'Add Review'
    expect(page).to have_content('Some kind of wonderful.')
    expect(ReviewMailer.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
