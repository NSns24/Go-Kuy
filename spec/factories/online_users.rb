# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :online_user do
  	user_id { Faker::Number.number(1) }
  	pickup_lat { Faker::Address.latitude }
  	pickup_lng { Faker::Address.longitude }
  	dest_lat { Faker::Address.latitude }
  	dest_lng { Faker::Address.longitude }

  	association :user
  end
end
