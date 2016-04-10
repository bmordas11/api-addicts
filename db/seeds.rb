20.times do
  FactoryGirl.create(:user,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email)
end

25.times do
  FactoryGirl.create(:api, user_id: rand(20 + 1))
end

15.times do
  FactoryGirl.create(:api, user_id: rand(20 + 1), paid: false)
end

100.times do
  FactoryGirl.create(:review, api_id: rand(40 + 1), user_id: rand(20 + 1))
end
