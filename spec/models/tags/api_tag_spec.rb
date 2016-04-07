require "rails_helper"

RSpec.describe Api, type: :model do

  it "has a tag associated with it" do
    test_api = Api.create(
    name: "Weather of Boston Api",
    url: "www.supercool.com/something123456789",
    paid: true,
    description: "This is what you want."
    )
  test_tag = Tag.create(name:"image_recognition")
  Apitag.create(api: test_api, tag: test_tag)

  result = test_api.tags.first.name

  expect(result).to eq("image_recognition")
  end
end
