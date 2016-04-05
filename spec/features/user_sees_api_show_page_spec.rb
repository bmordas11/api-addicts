require "rails_helper"

# [x] I want to visit an API show page so I can review it

feature "user can view an API show page" do
  # let(:user) { id: 1, email: "bobbymcfarlin@gmail.com", password: "2200nnsjsjs", first_name: "Bobby", last_name: "McFarlin" }
  let!(:api1) { Api.create(name: "Weather API for Noobs", url: "www.wunderground.com/something123456789",
    paid: false, description: "This is a sweet weather API that shows people the weather.")
  }
  let!(:api2) { Api.create(name: "Highest-Tech API Ever Encountered", url: "www.fishfillet.com/o0202000s0s0ss0weh2246262",
    paid: true, description: "This is the most advanced API ever made. Nobody knows how it works.")
  }
  scenario "user sees an api list for free API" do
    visit root_path
    click_link "Weather API for Noobs"

    expect(page).to have_content(api1.name)
    expect(page).to have_content(api1.url)
    expect(page).to have_content(api1.description)
    expect(page).to have_content("This API is free!")
  end
  scenario "user sees an api list for not free API" do
    visit root_path
    click_link "Highest-Tech API Ever Encountered"

    expect(page).to have_content(api2.name)
    expect(page).to have_content(api2.url)
    expect(page).to have_content(api2.description)
    expect(page).to have_content("This API is not free! (It costs money)")
  end
end
