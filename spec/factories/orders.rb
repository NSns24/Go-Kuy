FactoryGirl.define do
  factory :order do
  	driver_id { Faker::Number.number(1) }
  	user_id { Faker::Number.number(1) }
  	pickup_lat { Faker::Address.latitude }
  	pickup_lng { Faker::Address.longitude }
  	dest_lat { Faker::Address.latitude }
  	dest_lng { Faker::Address.longitude }
  	distance { Faker::Number.decimal(1, 1) }
  	pickup_datetime { '2018-09-11 17:51:00' }
  	finish_datetime { '2018-09-12 22:42:28' }
  	rating { Faker::Number.between(0, 5) }
  	comment { Faker::String.random }

  	association :driver
  	association :user
  end
end
