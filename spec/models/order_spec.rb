require 'rails_helper'

describe Order do

	it "has a valid factory" do
		expect(build(:order)).to be_valid
	end

end
