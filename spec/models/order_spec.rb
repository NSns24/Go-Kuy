# require 'rails_helper'

# describe Order do

# 	it "has a valid factory" do
# 		expect(build(:order)).to be_valid
# 	end

# 	it "is invalid without from_lat" do
# 		order = build(:order, from_lat: nil)
# 		order.valid?
# 		expect(order.errors[:from_lat]).to include("can't be blank")
# 	end

# 	it "is invalid without from_lng" do
# 		order = build(:order, from_lng: nil)
# 		order.valid?
# 		expect(order.errors[:from_lng]).to include("can't be blank")
# 	end

# 	it "is invalid without to_lat" do
# 		order = build(:order, to_lat: nil)
# 		order.valid?
# 		expect(order.errors[:to_lat]).to include("can't be blank")
# 	end

# 	it "is invalid without to_lng" do
# 		order = build(:order, to_lng: nil)
# 		order.valid?
# 		expect(order.errors[:to_lng]).to include("can't be blank")
# 	end

# 	it "is invalid without distance" do
# 		order = build(:order, distance: nil)
# 		order.valid?
# 		expect(order.errors[:distance]).to include("can't be blank")
# 	end

# 	it "is invalid without order_time" do
# 		order = build(:order, order_time: nil)
# 		order.valid?
# 		expect(order.errors[:order_time]).to include("can't be blank")
# 	end

# 	# it "is invalid without finish_time" do

# 	# end

	
# end
