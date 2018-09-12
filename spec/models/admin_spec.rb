require 'rails_helper'

# RSpec.describe Admin, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
# end

describe Admin do

	it "has a valid factory" do
		expect(build(:admin)).to be_valid
	end

	it "is invalid without email" do
		admin = build(:admin, email: nil)
		admin.valid?
		expect(admin.errors[:email]).to include("can't be blank")
	end

	it "is invalid without password" do
		admin = build(:admin, password: nil)
		admin.valid?
		expect(admin.errors[:password]).to include("can't be blank")
	end



end
