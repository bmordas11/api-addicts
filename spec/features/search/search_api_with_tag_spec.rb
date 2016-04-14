require 'rails_helper'

feature 'user searches database with API name + tags related to API' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:tag1) { FactoryGirl.create(:tag) }
  let!(:tag2) { FactoryGirl.create(:tag) }
  let!(:api1)  { FactoryGirl.create(:api, user: user1) }
  let!(:api2)  { FactoryGirl.create(:api, user: user1, paid: true) }
  let!(:apitag1) { ApiTag.create(api: api1, tag: tag1) }
  let!(:apitag2) { ApiTag.create(api: api2, tag: tag2) }

  scenario 'can search through APIs by API name' do
    visit apis_path

    fill_in 'search', with: api1.name
    click_on 'Search'

    expect(page).to have_content api1.name
    expect(page).to_not have_content api2.name
  end

  scenario 'can search through APIs by API tag' do
    visit apis_path

    fill_in 'search', with: tag1.name
    click_on 'Search'

    expect(page).to have_content api1.name
    expect(page).to_not have_content api2.name
  end
end
