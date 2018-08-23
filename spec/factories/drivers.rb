# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :driver do
  	name { Faker::Name.name }
  	email { Faker::Internet.free_email }
  	password { Faker::Internet.password }
  end
end
