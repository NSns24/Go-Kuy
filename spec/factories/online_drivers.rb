# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :online_driver do
  	driver_id { Faker::Number.number(1) }
  	current_lat { Faker::Address.latitude }
  	current_lng { Faker::Address.longitude }

  	association :driver
  end
end
