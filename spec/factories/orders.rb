FactoryGirl.define do
  factory :order do
  	association :driver
  	association :user
  end
end
