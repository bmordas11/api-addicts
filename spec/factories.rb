FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@apiaddict.xyz" }
    first_name 'Richie'
    last_name 'Cunningham'
    password 'password'
    password_confirmation 'password'
  end
  factory :api do
    sequence(:name) { |n| "API ##{n}" }
    sequence(:url)  { |n| "www.apiaddict.xyz/api#{n}" }
    description 'This is an awesome paid API.'
    paid false
    user_id 1
  end
  factory :review do
    sequence(:body) { |n| "Of all the APIs, this is my ##{n} favorite." }
    rating 3
    user_id 1
    api_id 1
  end
end
