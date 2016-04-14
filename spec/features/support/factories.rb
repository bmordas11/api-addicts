FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    first_name 'Jone'
    last_name 'Smith'
    password 'password'
    password_confirmation 'password'
  end
end
