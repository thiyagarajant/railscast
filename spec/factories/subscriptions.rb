# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    user_id 1
    ip_address "MyString"
    first_name "MyString"
    last_name "MyString"
    card_type "MyString"
    card_expires_on "2013-01-10"
  end
end
