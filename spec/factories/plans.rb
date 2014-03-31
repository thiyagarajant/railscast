# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    name "MyString"
    description "MyText"
    price 1.5
  end
end
