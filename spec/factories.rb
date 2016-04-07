FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Jone'
    last_name 'Smith'
    password 'password'
    password_confirmation 'password'
  end
  factory :api do
    sequence(:name) { |n| "person#{n} api" }
    url "www.wunderground.com/something123456789"
    paid false
    user_id 1
    description "This is a weather API that shows people weather."
  end
  factory :review do
    sequence(:body) { |n| "This is the #{n} best API I've ever used"}
    rating 3
    user_id 1
    api_id 1
  end
end
