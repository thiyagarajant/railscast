# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribe_transaction do
    subscription_id 1
    action "MyString"
    amount 1
    success false
    authorization "MyString"
    message "MyString"
    params "MyText"
  end
end
