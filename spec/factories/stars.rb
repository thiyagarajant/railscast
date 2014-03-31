# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :star do
    rating 1.5
    episode_id 1
    user_id 1
    average_rating 1.5
  end
end
