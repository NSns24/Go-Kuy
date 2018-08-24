# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
  	email { Faker::Internet.free_email }
  	dob { Faker::Date.birthday(18, 65) }
  	phone { Faker::Number.number(10) }
	password { Faker::Internet.password }
  end
end
