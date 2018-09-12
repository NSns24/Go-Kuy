# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
  	email { Faker::Internet.free_email }
  	password { Faker::Internet.password }
  end
end
