require "rails_helper"

RSpec.describe Api, type: :model do
  # test_api = Api.create(
  # name: "Weather API for Noobs",
  # url: "www.wunderground.com/something123456789",
  # paid: false,
  # description: "This is a weather API that shows people weather."
  # )
  test_tag = Tag.create(name:"image_recognition")

  Apitag.create(api: Api.find(1), tag: test_tag)
binding.pry
  result = Api.find(1).tags[0]

  expect(result).to eq("image_recognition")
end
