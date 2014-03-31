# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :episode do
    title "MyString"
    description "MyText"
    note "MyString"
    category_id 1
    picture  File.join( Rails.root, 'app', 'assets', 'images','rails.png')
     #video "MyString"
  end
end
