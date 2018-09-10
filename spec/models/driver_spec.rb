require 'rails_helper'

# RSpec.describe Driver, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe Driver do

	it "has a valid factory" do
		expect(build(:driver)).to be_valid
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

	it "is invalid with a duplicate email in driver table" do
		driver1 = create(:driver, email: "tommywillianto@yahoo.com")
		driver2 = build(:driver, email: "tommywillianto@yahoo.com")
		driver2.valid?
		expect(driver2.errors[:email]).to include("has already been taken")
	end

	it "is invalid with a duplicate email in user table" do
		user1 = create(:user, email: "tommywillianto@yahoo.com")
		driver2 = build(:driver, email: "tommywillianto@yahoo.com")
		driver2.valid?
		expect(driver2.errors[:email]).to include("has already been taken")
	end

	it "is valid without duplicate email" do
		driver1 = create(:driver, email: "tommywillianto@yahoo.com")
		driver2 = build(:driver, email: "williantommy@yahoo.com")
		expect(driver2).to be_valid
	end

	it "is invalid without date of birth" do
		driver = build(:driver, dob: nil)
		driver.valid?
		expect(driver.errors[:dob]).to include("can't be blank")
	end

	it "is invalid with age less than 16" do
		driver = build(:driver, dob: "26/03/2018")
		driver.valid?
		expect(driver.errors[:dob]).to include("must be at least 16 years old")
	end

	it "is valid with age greater than or equal to 16" do
		expect(build(:driver, dob: "09/09/2002")).to be_valid
	end

	it "is invalid without a phone" do
		driver = build(:driver, phone: nil)
		driver.valid?
		expect(driver.errors[:phone]).to include("can't be blank")
	end

	it "is invalid with a phone length less than 10" do
		driver = build(:driver, phone: "123456789")
		driver.valid?
		expect(driver.errors[:phone]).to include("is not valid")
	end

	it "is valid with phone length greater than or equal to 10" do
		expect(build(:driver, phone: "0123456789")).to be_valid
	end

	it "is invalid without numeric phone" do
		driver = build(:driver, phone: "asd")
		driver.valid?
		expect(driver.errors[:phone]).to include("must be a number")
	end

	it "is valid with numeric phone" do
		expect(build(:driver, phone: "0123456789")). to be_valid
	end

	it "is invalid with a duplicate phone" do
		driver1 = create(:driver, phone: "081234567890")
		driver2 = build(:driver, phone: "081234567890")
		driver2.valid?
		expect(driver2.errors[:phone]).to include("has already been taken")
	end

	it " is valid without duplicate phone" do 
		driver1 = create(:driver, phone: "081234567890")
		driver2 = build(:driver, phone: "081234567899")
		expect(driver2).to be_valid
	end

	it "is invalid without a license plate" do
		driver = build(:driver, license_plate: nil)
		driver.valid?
		expect(driver.errors[:license_plate]).to include("can't be blank")
	end

	it "is invalid with a duplicate license plate" do
		driver1 = create(:driver, license_plate: "18122")
		driver2 = build(:driver, license_plate: "18122")
		driver2.valid?
		expect(driver2.errors[:license_plate]).to include("has already been taken")
	end

	it "is valid without a duplicate license plate" do
		driver1 = create(:driver, license_plate: "B8122")
		driver2 = build(:driver, license_plate: "B8182")
		expect(driver2).to be_valid
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

	it "is valid with password length greater than or equal to 6" do
		expect(build(:driver, password: "123456")).to be_valid
	end

	it "is valid with image_url ending with '.gif', '.jpg', or '.png'" do
		expect(build(:driver, image_url: "food.jpg")).to be_valid
	end

	it "is invalid with image_url ending not with '.gif', '.jpg', or '.png'" do
		driver = build(:driver, image_url: "food.csv")
		driver.valid?
		expect(driver.errors[:image_url]).to include("must be a URL for GIF, JPG or PNG image.")

	end

end
