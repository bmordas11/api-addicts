require 'rails_helper'

feature 'user can view a list of apis' do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:api1)  do
    FactoryGirl.create(:api, user: user,
    url: 'www.apiaddict.xyz/api')
  end
  let!(:api2) do
    FactoryGirl.create(:api, user: user, paid: true,
    url: 'www.apiaddict.xyz/api')
  end
  scenario 'sees a list of apis' do
    visit apis_path

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api2.name)
  end
end
