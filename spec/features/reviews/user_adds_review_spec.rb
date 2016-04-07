require "rails_helper"

feature "user adds a new review" do
  # [x] As a User,
  #     I want to add a new review for an API
  #     So others can see and learn from it

  let!(:weather) do
    Api.create!(
      name: "Weather API for Noobs",
      url: "www.wunderground.com/something123456789",
      description: "This is a weather API that shows people weather.",
      paid: false,
      user: user1
    )
  end

  let(:user1) { FactoryGirl.create(:user) }
  scenario "successfully adds API review" do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit apis_path
    click_link "Weather API for Noobs"

    fill_in 'Body', with: 'This is the best weather API ever!'
    expect(page).to have_content('Rating')
    choose("4")
    click_button 'Add Review'
    expect(page).to have_content("This is the best weather API ever!")
    expect(page).to have_content("4")
    expect(page).to have_content("Review Submitted!")
  end

  scenario "unsuccessful API review attempted (rating missing)" do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit apis_path
    click_link "Weather API for Noobs"

    fill_in 'Body', with: 'This is the best weather API ever!'

    click_button 'Add Review'
    expect(page).to have_content("Rating is not included in the list.")
    expect(page).to have_content("Review Not Submitted")
  end

  scenario "unsuccessful API review attempted (body missing)" do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit apis_path
    click_link "Weather API for Noobs"

    choose('2')

    click_button 'Add Review'
    expect(page).to have_content("Body can't be blank.")
    expect(page).to have_content("Review Not Submitted")
  end
end
