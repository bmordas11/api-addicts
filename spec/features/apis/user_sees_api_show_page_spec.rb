require "rails_helper"

# [x] I want to visit an API show page so I can review it

feature "user can view an API show page" do
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

  scenario "user sees an api list for free API" do
    visit apis_path
    click_link "Weather API for Noobs"

    expect(page).to have_content(weather.name)
    expect(page).to have_content(weather.url)
    expect(page).to have_content(weather.description)
    expect(page).to have_content("This API is free!")
  end

  scenario "user sees an api list for not free API" do
    visit apis_path
    click_link "MBTA in MA"

    expect(page).to have_content(mbta.name)
    expect(page).to have_content(mbta.url)
    expect(page).to have_content(mbta.description)
    expect(page).to have_content
      ("This API is not free! (It costs money)")
  end
end
