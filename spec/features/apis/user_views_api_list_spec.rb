require "rails_helper"

# [x] I want to visit the API index page so I can see what APIs there are

feature "user can view a list of apis" do
  let!(:user1) { FactoryGirl.create(:user) }

  let!(:weather) do
    Api.create!(
      name: "Weather API for Noobs",
      url: "www.wunderground.com/something123456789",
      description: "This is a weather API that shows people weather.",
      paid: false,
      user: user1
    )
  end

  let!(:mbta) do
    Api.create!(
      name: "MBTA in MA",
      url: "www.mbtastuffapi.com/s444444SSSSDAF3456789",
      description: "This is a weather API that shows people weather.",
      paid: true,
      user: user1
    )
  end

  scenario "user sees an api list" do
    visit apis_path

    expect(page).to have_content(weather.name)
    expect(page).to have_content(weather.url)
    expect(page).to have_content(mbta.name)
    expect(page).to have_content(mbta.url)
  end
end
