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
    association :user, factory: :user
    trait (:paid) { paid true}
    trait (:free) { paid false}
  end
  factory :review do
    sequence(:body) { |n| "Of all the APIs, this is my ##{n} favorite." }
    rating 3
    association :user, factory: :user
    association :api, factory: :api
  end
  factory :tag do
    sequence(:name) { |n| "API#{n}" }
  end
end
