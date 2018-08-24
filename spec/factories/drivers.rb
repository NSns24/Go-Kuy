# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :driver do
  	name { Faker::Name.name }
  	email { Faker::Internet.free_email }
  	dob { Faker::Date.birthday(18, 65) }
  	phone { Faker::Number.number(10) }
  	license_plate { Faker::Number.number(4) }
  	password { Faker::Internet.password }
  end
end
