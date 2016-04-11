require 'rails_helper'

# USER STORY:
# As an authenticated user
# I want to visit the API index page
# So I can see what APIs there are

feature 'user can view a list of apis' do
  let!(:user) { FactoryGirl.create(:user, id: 1) }
  let!(:api1) do
    FactoryGirl.create(:api,
    user_id: 1,
    url: 'www.apiaddict.xyz/api')
  end
  let!(:api2) do
    FactoryGirl.create(:api,
    user_id: 1,
    paid: true,
    url: 'www.apiaddict.xyz/api')
  end
  scenario 'sees a list of apis' do
    visit apis_path

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api2.name)
  end
end
