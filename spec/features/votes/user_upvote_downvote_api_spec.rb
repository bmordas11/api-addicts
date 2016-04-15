require "rails_helper"
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

feature "user upvotes and downvotes APIs" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:api1) { FactoryGirl.create(:api) }
  scenario "signed in user finds a fresh api with 0 votes" do
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    visit apis_path

    click_link api1.name

    within('div#upvote') do
      expect(page).to have_content("0")
    end

    within('div#downvote') do
      expect(page).to have_content("0")
    end
  end

  scenario "signed in user upvotes an api and is reflected on the page
    without reloading it", js: true do

    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_button 'Sign In'
    visit apis_path
    click_link api1.name

    find('div#upvote').click
    within('div#upvote') do
      expect(page).to have_content("1")
    end

    within('div#downvote') do
      expect(page).to have_content("0")
    end
  end

  scenario "signed out user upvotes an api no vote is added", js: true do
    visit apis_path
    click_link api1.name

    find('div#upvote').click
    within('div#upvote') do
      expect(page).to have_content("0")
    end
    within('div#downvote') do
      expect(page).to have_content("0")
    end
  end
end
