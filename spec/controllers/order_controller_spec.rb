require 'rails_helper'

RSpec.describe OrderController, type: :controller do

	before :each do
    	@user = create(:user)
    	@driver = create(:driver)
    	@onlineUser = create(:online_user)
  	end

  	describe "POST #createOrder" do
  		before :each do
        	sign_in @driver
      	end

      	it "returns json" do
  			post :createOrder, :params => { 
  				:order => { 
  					:user_id => @user.id, :pickup_lat => @onlineUser.pickup_lat, :pickup_lng => @onlineUser.pickup_lng, :dest_lat => @onlineUser.dest_lat, :dest_lng => @onlineUser.dest_lng, :id => @onlineUser.id  
  				},

  				:distance => 0.2 
  			}

  			expect(response.content_type).to eq "application/json"
  		end

  		it "success create order" do
  			post :createOrder, :params => { 
  				:order => { 
  					:user_id => @user.id, :pickup_lat => @onlineUser.pickup_lat, :pickup_lng => @onlineUser.pickup_lng, :dest_lat => @onlineUser.dest_lat, :dest_lng => @onlineUser.dest_lng, :id => @onlineUser.id  
  				},

  				:distance => 0.2 
  			}

  			expect(JSON(response.body)).not_to eq(nil) 
  		end

  		it "failed create order" do
  			post :createOrder, :params => { 
  				:order => { 
  					:pickup_lat => @onlineUser.pickup_lat, :pickup_lng => @onlineUser.pickup_lng, :dest_lat => @onlineUser.dest_lat, :dest_lng => @onlineUser.dest_lng, :id => @onlineUser.id
  				},

  				:distance => 0.2 
  			}
	 
  			expect(JSON(response.body)).to eq(nil)
  		end
  	end

  	describe "POST #checkOrderUser" do
  		before :each do
        	sign_in @user
      	end

  		it "returns json" do
  			post :checkOrderUser
  			expect(response.content_type).to eq "application/json"
  		end
  	end

  	describe "POST #checkOrderDriver" do
  		before :each do
        	sign_in @driver
      	end

  		it "returns json" do
  			post :checkOrderDriver
  			expect(response.content_type).to eq "application/json"
  		end
  	end

  	describe "POST #startWorking" do
  		before :each do
        	sign_in @driver
        	@order = create(:order, pickup_datetime: nil, finish_datetime: nil, rating: nil, comment: nil)
      	end

  		it "returns json" do
  			post :startWorking, :params => { 
  				:order_id => @order.id
  			}

  			expect(response.content_type).to eq "application/json"
  		end

  		it "success update pickup_datetime" do
  			post :startWorking, :params => { 
  				:order_id => @order.id
  			}

  			@order.reload
  			expect(@order.pickup_datetime).not_to eq nil
  		end
  	end

  	describe "POST #finishWorking" do
  		before :each do
        	sign_in @driver
        	@order = create(:order, finish_datetime: nil, rating: nil, comment: nil)
      	end

  		it "returns json" do
  			post :finishWorking, :params => { 
  				:order_id => @order.id
  			}

  			expect(response.content_type).to eq "application/json"
  		end

  		it "success update finish_datetime" do
  			post :finishWorking, :params => { 
  				:order_id => @order.id
  			}

  			@order.reload
  			expect(@order.finish_datetime).not_to eq nil
  		end
  	end

  	describe "POST #saveRating" do
  		before :each do
        	sign_in @user
        	@order = create(:order, rating: nil, comment: nil)
      	end

      	it "returns json" do
  			post :saveRating, :params => { 
  				:comments => 'TESTES',
  				:no_helm => 1,
  				:id => @order.id,
  				:rating => 5
  			}

  			expect(response.content_type).to eq "application/json"
  		end

  		it "success save rating" do
  			post :saveRating, :params => { 
  				:comments => 'TESTES',
  				:no_helm => 1,
  				:id => @order.id,
  				:rating => 5
  			}

  			#@order.reload
  			#expect(@order.rating).not_to eq nil
  			expect(JSON(response.body)["status"]).to eq("Success") 
  		end

  		it "failed save rating" do
  			post :saveRating, :params => { 
  				:comments => 'TESTES',
  				:no_helm => 1,
  				:id => @order.id,
  				:rating => 5
  			}

  			expect(@order.rating).to eq nil
  			#expect(JSON(response.body)["status"]).to eq("Failed") 
  		end
  	end

end