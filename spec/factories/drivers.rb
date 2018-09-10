# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :driver do
  	name { Faker::Name.name }
  	email { Faker::Internet.free_email }
  	# dob { Faker::Date.birthday(16, 65) }
  	dob { "26/03/1969"}
  	phone { Faker::Number.number(10) }
  	license_plate { Faker::Number.number(4) }
  	password { Faker::Internet.password }
  end
end
