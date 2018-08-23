require 'rails_helper'

# RSpec.describe Driver, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe Driver do

	it "has a valid factory" do
		expect(build(:driver)).to be_valid
	end

	it "is valid with password length greater than or equal to 6" do
		expect(build(:driver, password: "123456")).to be_valid
	end

	it "is invalid without a name" do
		driver = build(:driver, name: nil)
		driver.valid?
		expect(driver.errors[:name]).to include("can't be blank")
	end

	it "is invalid without an email" do
		driver = build(:driver, email: nil)
		driver.valid?
		expect(driver.errors[:email]).to include("can't be blank")
	end

	it "is invalid without a password" do
		driver = build(:driver, password: nil)
		driver.valid?
		expect(driver.errors[:password]).to include("can't be blank")
	end

	it "is invalid with password length less than 6" do
		driver = build(:driver, password: "123")
		driver.valid?
		expect(driver.errors[:password]).to include("is too short (minimum is 6 characters)")
	end

	it "is invalid with a duplicate email" do
		driver1 = create(:driver, email: "tommywillianto@yahoo.com")
		driver2 = build(:driver, email: "tommywillianto@yahoo.com")
		driver2.valid?
		expect(driver2.errors[:email]).to include("has already been taken")
	end

	# belum register
	it "is invalid " do
		
	end




end
