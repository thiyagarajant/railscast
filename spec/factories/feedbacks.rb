# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    name "MyString"
    email "MyString"
    message "MyText"
  end
end
