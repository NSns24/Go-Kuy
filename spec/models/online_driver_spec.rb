require 'rails_helper'

# RSpec.describe OnlineDriver, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
# end


describe OnlineDriver do

	it "has a valid factory" do
		expect(build(:online_driver)).to be_valid
	end

	it "is invalid without driver_id" do
		online_driver = build(:online_driver, driver_id: nil)
		online_driver.valid?
		expect(online_driver.errors[:driver_id]).to include("can't be blank")
	end

	it "is invalid without current_lat" do
		online_driver = build(:online_driver, current_lat: nil)
		online_driver.valid?
		expect(online_driver.errors[:current_lat]).to include("can't be blank")
	end

	it "is invalid without current_lng" do
		online_driver = build(:online_driver, current_lng: nil)
		online_driver.valid?
		expect(online_driver.errors[:current_lng]).to include("can't be blank")
	end

	it "is invalid without numeric driver_id" do
		online_driver = build(:online_driver, driver_id: "asd")
		online_driver.valid?
		expect(online_driver.errors[:driver_id]).to include("is not a number")
	end

	# it "is valid with numeric driver_id" do
	# 	expect(build(:online_driver, driver_id: "1")). to be_valid
	# end

	it "is invalid without numeric current_lat" do
		online_driver = build(:online_driver, current_lat: "asd")
		online_driver.valid?
		expect(online_driver.errors[:current_lat]).to include("is not a number")
	end

	it "is valid with numeric current_lat" do
		expect(build(:online_driver, current_lat: "0.349292347933673e2")). to be_valid
	end

	it "is invalid without numeric current_lng" do
		online_driver = build(:online_driver, current_lng: "asd")
		online_driver.valid?
		expect(online_driver.errors[:current_lng]).to include("is not a number")
	end

	it "is valid with numeric current_lng" do
		expect(build(:online_driver, current_lng: "0.349292347933673e2")). to be_valid
	end


end