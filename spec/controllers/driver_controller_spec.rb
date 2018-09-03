require 'rails_helper'
include DeviseHelpers

RSpec.describe DriverController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "has already login" do
    	driver = create(:driver)
    	sign_in driver
    	expect(assigns(:driver)).to sign_in
    end
  end

end
