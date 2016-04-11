require 'rails_helper'

# [x] user search the database with api name and tags related to the api

feature 'user search the database with api name and tags related to the api' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:tag1) {FactoryGirl.create(:tag)}
  let!(:tag2) {FactoryGirl.create(:tag)}
  let!(:api1)  { FactoryGirl.create(:api, user_id: user1.id) }
  let!(:api2)  { FactoryGirl.create(:api, user_id: user1.id, paid: true) }
  let!(:apitag1) { ApiTag.create(api_id: api1.id, tag_id: tag1.id) }
  let!(:apitag2) { ApiTag.create(api_id: api2.id, tag_id: tag2.id) }
  scenario 'There is a search form for Apis on the api_addicts index so we
    can search api by api name.' do
    visit apis_path

    fill_in 'search', with: api1.name
    click_on 'Search'

    expect(page).to have_content api1.name
    expect(page).to_not have_content api2.name
  end
  scenario 'There is a search form for Apis on the api_addicts index so we can
    search api by tags.' do
    visit apis_path

    fill_in 'search', with: tag1.name
    click_on 'Search'

    expect(page).to have_content api1.name
    expect(page).to_not have_content api2.name
  end
end
