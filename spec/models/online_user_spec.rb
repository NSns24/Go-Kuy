require 'rails_helper'

# RSpec.describe OnlineUser, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
# end


describe OnlineUser do

	it "has a valid factory" do
		expect(build(:online_user)).to be_valid
	end

	it "is invalid without user_id" do
		online_user = build(:online_user, user_id: nil)
		online_user.valid?
		expect(online_user.errors[:user_id]).to include("can't be blank")
	end

	it "is invalid without pickup_lat" do
		online_user = build(:online_user, pickup_lat: nil)
		online_user.valid?
		expect(online_user.errors[:pickup_lat]).to include("can't be blank")
	end

	it "is invalid without pickup_lng" do
		online_user = build(:online_user, pickup_lng: nil)
		online_user.valid?
		expect(online_user.errors[:pickup_lng]).to include("can't be blank")
	end

	it "is invalid without dest_lat" do
		online_user = build(:online_user, dest_lat: nil)
		online_user.valid?
		expect(online_user.errors[:dest_lat]).to include("can't be blank")
	end

	it "is invalid without dest_lng" do
		online_user = build(:online_user, dest_lng: nil)
		online_user.valid?
		expect(online_user.errors[:dest_lng]).to include("can't be blank")
	end

	it "is invalid without numeric user_id" do
		online_user = build(:online_user, user_id: "asd")
		online_user.valid?
		expect(online_user.errors[:user_id]).to include("is not a number")
	end

	# it "is valid with numeric user_id" do
	# 	expect(build(:online_user, user_id: "1")). to be_valid
	# end

	it "is invalid without numeric pickup_lat" do
		online_user = build(:online_user, pickup_lat: "asd")
		online_user.valid?
		expect(online_user.errors[:pickup_lat]).to include("is not a number")
	end

	it "is valid with numeric pickup_lat" do
		expect(build(:online_user, pickup_lat: "0.349292347933673e2")). to be_valid
	end

	it "is invalid without numeric pickup_lng" do
		online_user = build(:online_user, pickup_lng: "asd")
		online_user.valid?
		expect(online_user.errors[:pickup_lng]).to include("is not a number")
	end

	it "is valid with numeric pickup_lng" do
		expect(build(:online_user, pickup_lng: "0.349292347933673e2")). to be_valid
	end

	it "is invalid without numeric dest_lat" do
		online_user = build(:online_user, dest_lat: "asd")
		online_user.valid?
		expect(online_user.errors[:dest_lat]).to include("is not a number")
	end

	it "is valid with numeric dest_lat" do
		expect(build(:online_user, dest_lat: "0.349292347933673e2")). to be_valid
	end

	it "is invalid without numeric dest_lng" do
		online_user = build(:online_user, dest_lng: "asd")
		online_user.valid?
		expect(online_user.errors[:dest_lng]).to include("is not a number")
	end

	it "is valid with numeric dest_lng" do
		expect(build(:online_user, dest_lng: "0.349292347933673e2")). to be_valid
	end

end
