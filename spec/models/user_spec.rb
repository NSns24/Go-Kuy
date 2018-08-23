require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	it "is valid with password length greater than or equal to 6" do
		expect(build(:user, password: "123456")).to be_valid
	end

	it "is invalid without a name" do
		user = build(:user, name: nil)
		user.valid?
		expect(user.errors[:name]).to include("can't be blank")
	end

	it "is invalid without an email" do
		user = build(:user, email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end

	it "is invalid without a password" do
		user = build(:user, password: nil)
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid with password length less than 6" do
		user = build(:user, password: "123")
		user.valid?
		expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
	end

	it "is invalid with a duplicate email" do
		user1 = create(:user, email: "tommywillianto@yahoo.com")
		user2 = build(:user, email: "tommywillianto@yahoo.com")
		user2.valid?
		expect(user2.errors[:email]).to include("has already been taken")
	end

	# belum register
	it "is invalid " do
		
	end




end
