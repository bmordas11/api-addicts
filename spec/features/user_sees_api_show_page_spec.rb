require "rails_helper"

# [x] I want to visit an API show page so I can review it

feature "user can view an API show page" do
  let!(:api1) do
    Api.create(
      name: "Weather API for Noobs",
      url: "www.wunderground.com/something123456789",
      paid: false,
      description: "This is a weather API that shows people weather."
    )
  end

  let!(:api2) do
    Api.create(
      name: "MBTA in MA",
      url: "www.mbtanicenice.com/indoooowww/osaoosossa/o222224",
      paid: false,
      description: "This is an awesome MBTA times API."
    )
  end

  scenario "user sees an api list for free API" do
    visit apis_path
    click_link "Weather API for Noobs"

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api1.url)
    expect(page).to have_content(api1.description)
    expect(page).to have_content("This API is free!")
  end

  scenario "user sees an api list for not free API" do
    visit apis_path
    click_link "MBTA in MA"

    expect(page).to have_content(api2.name)
    expect(page).to have_content(api2.url)
    expect(page).to have_content(api2.description)
    expect(page).to have_content
      ("This API is not free! (It costs money)")
  end
end
