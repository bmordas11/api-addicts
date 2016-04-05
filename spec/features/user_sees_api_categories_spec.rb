# require "rails_helper"
#
# # [ ] I want be able to see the APIs in their respective categories
# # [ ] I want be able to see the APIs in their respective ratings
#
# feature "user views a list of apis" do
#   # let(:user) { id: 1, email: "bobbymcfarlin@gmail.com", password: "2200nnsjsjs", first_name: "Bobby", last_name: "McFarlin" }
#   let!(:api1) { Api.create(name: "Weather API for Noobs", url: "www.wunderground.com/something123456789",
#     paid: false, description: "This is a sweet weather API that shows people the weather.")
#   }
#   let!(:api2) { Api.create(name: "MBTA in MA", url: "www.mbtanicenice.com/indoooowww/osaoosossa/o222224",
#     paid: false, description: "This is an awesome MBTA times API. IT WILL CHANGE YOUR WORLD.")
#   }
#   let!(:api3) { Api.create(name: "Some Cool API", url: "www.something.com/osinow2352ooww",
#     paid: false, description: "This is the cooliest API.")
#   }
#   scenario "user sees an api list" do
#     visit root_path
#
#     expect(this).to appear_before(that)
#     expect(page).to have_content(api1.name)
#     expect(page).to have_content(api1.url)
#     expect(page).to have_content(api2.name)
#     expect(page).to have_content(api2.url)
#   end
#
#   scenario "user sees an api list" do
#     visit root_path
#
#     expect(page).to have_content(api1.name)
#     expect(page).to have_content(api1.url)
#     expect(page).to have_content(api2.name)
#     expect(page).to have_content(api2.url)
#   end
# end
