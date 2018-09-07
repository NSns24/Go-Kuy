require 'rails_helper'

RSpec.describe UserController, type: :controller do

  before :each do
      @user = create(:user)
      @driver = create(:driver)
    end

  # describe "GET #index" do

  #   context "user is signed in" do
  #     before :each do
  #       sign_in @user
  #     end
  #     it "returns http success when user is signed in" do
  #       sign_in @user
  #       get :index
  #       expect(response).to have_http_status(:success)
  #     end
  #     it "renders the :index template when user is signed in" do
  #         get :index
  #         expect(response).to  render_template :index
  #     end
  #   end

  #   context "user is not signed in" do
  #     it "returns status code 302 when user is not signed in" do
  #       get :index
  #       expect(response).to have_http_status(302)
  #     end
  #     it "returns status code 302 when driver tries to access" do
  #       sign_in @driver
  #       get :index
  #       expect(response).to have_http_status(302)
  #     end
  #   end
  #   # redirect kalo belom signed in
  # end

  describe "GET #profile" do

    context "user is signed in" do
      before :each do
        sign_in @user
      end
      it "renders the :profile template" do
        get :profile
        expect(response).to render_template :profile
      end
    end

    context "user is not signed in" do
    end 
  end

  describe "GET #order" do

    context "user is signed in" do
      before :each do
        sign_in @user
      end
      it "renders the :order template" do
        get :order
        expect(response).to render_template :order
      end
    end
    
  end








end
