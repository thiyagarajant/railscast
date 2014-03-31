# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name      { Faker::Name.name      }
    email     { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    mobile_no 1234565997
  end
end
