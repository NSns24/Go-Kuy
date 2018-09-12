require 'rails_helper'
# include DeviseHelpers

RSpec.describe DriverController, type: :controller do

  before :each do
    @user = create(:user)
    @driver = create(:driver)
  end

  describe "GET #index" do
  
    context "driver is signed in" do
      before :each do
        sign_in @driver
      end
      it "returns http success when driver is signed in" do
        get :index
        expect(response).to have_http_status(:success)
      end
      it "renders the :index template when driver is signed in" do
          get :index
          expect(response).to  render_template :index
      end
    end

    context "driver is not signed in" do
      it "returns status code 302 when driver is not signed in" do
        get :index
        expect(response).to have_http_status(302)
      end
      it "returns status code 302 when user tries to access" do
        sign_in @user
        get :index
        expect(response).to have_http_status(302)
      end
      it "redirects to driver login page" do
        get :index
        expect(response).to redirect_to new_driver_session_path
      end
    end
  end


  describe "GET #profile" do

    context "driver is signed in" do
      before :each do
        sign_in @driver
      end
      it "renders the :profile template" do
        get :profile
        expect(response).to render_template :profile
      end
    end

     context "driver is not signed in" do
      it "returns status code 302 when driver is not signed in" do
        get :index
        expect(response).to have_http_status(302)
      end
      it "returns status code 302 when user tries to access" do
        sign_in @user
        get :index
        expect(response).to have_http_status(302)
      end
      it "redirects to driver login page" do
        get :index
        expect(response).to redirect_to new_driver_session_path
      end
    end
  end



  describe "GET #history" do
  
    context "driver is signed in" do
      before :each do
        sign_in @driver
      end
      it "returns http success when driver is signed in" do
        get :index
        expect(response).to have_http_status(:success)
      end
      it "renders the :history template when driver is signed in" do
          get :history
          expect(response).to  render_template :history
      end
    end

    context "driver is not signed in" do
      it "returns status code 302 when driver is not signed in" do
        get :index
        expect(response).to have_http_status(302)
      end
      it "returns status code 302 when user tries to access" do
        sign_in @user
        get :index
        expect(response).to have_http_status(302)
      end
      it "redirects to driver login page" do
        get :index
        expect(response).to redirect_to new_driver_session_path
      end
    end
  end


  describe "GET #job" do

    context "driver is signed in" do
      before :each do
        sign_in @driver
      end
      it "renders the :job template" do
        get :job
        expect(response).to render_template :job
      end
    end

  end

end
