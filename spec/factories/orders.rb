FactoryGirl.define do
  factory :order do
  	from_lat { Faker::Address.latitude }
  	from_lng { Faker::Address.longitude }
  	to_lat { Faker::Address.latitude }
  	to_lng { Faker::Address.longitude }
  	distance { Faker::Number.number(4) }
  	order_time { Faker::Time.between(2.days.ago, Date.today, :afternoon) }
  	finish_time { Faker::Time.between(2.days.ago, Date.today, :evening) }

  end
end
