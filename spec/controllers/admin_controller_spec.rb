require 'rails_helper'

RSpec.describe AdminController, type: :controller do

	before :each do
		@user = create(:user)
		@admin = create(:admin)
	end

	describe "GET #index" do

		context "admin is signed in" do
			before :each do
				sign_in @admin
			end
			it "returns http success when admin is signed in" do
				get :index
				expect(response).to have_http_status(:success)
			end
			it "renders the :index template when admin is signed in" do
				get :index
				expect(response).to  render_template :index
			end
		end

		context "admin is not signed in" do
			it "returns status code 302 when admin is not signed in" do
				get :index
				expect(response).to have_http_status(302)
			end
			it "returns status code 302 when user tries to access" do
				sign_in @user
				get :index
				expect(response).to have_http_status(302)
			end

			it "redirects to main page" do
				get :index
				expect(response).to redirect_to root_path
			end
		end
	end

	describe "GET #user" do

		context "admin is signed in" do
			before :each do
				sign_in @admin
			end
			it "returns http success when admin is signed in" do
				get :index
				expect(response).to have_http_status(:success)
			end
			it "renders the :user template when admin is signed in" do
				get :user
				expect(response).to  render_template :user
			end
		end

		context "admin is not signed in" do
			it "returns status code 302 when admin is not signed in" do
				get :index
				expect(response).to have_http_status(302)
			end
			it "returns status code 302 when user tries to access" do
				sign_in @user
				get :index
				expect(response).to have_http_status(302)
			end
			it "redirects to main page" do
				get :index
				expect(response).to redirect_to root_path
			end
		end

	end

	describe "GET #driver" do

		context "admin is signed in" do
			before :each do
				sign_in @admin
			end
			it "returns http success when admin is signed in" do
				get :index
				expect(response).to have_http_status(:success)
			end
			it "renders the :driver template when admin is signed in" do
				get :driver
				expect(response).to  render_template :driver
			end
		end

		context "admin is not signed in" do
			it "returns status code 302 when admin is not signed in" do
				get :index
				expect(response).to have_http_status(302)
			end
			it "returns status code 302 when user tries to access" do
				sign_in @user
				get :index
				expect(response).to have_http_status(302)
			end
			it "redirects to main page" do
				get :index
				expect(response).to redirect_to root_path
			end
		end

	end


	describe "GET #order" do

		context "admin is signed in" do
			before :each do
				sign_in @admin
			end
			it "returns http success when admin is signed in" do
				get :index
				expect(response).to have_http_status(:success)
			end
			it "renders the :order template when admin is signed in" do
				get :order
				expect(response).to  render_template :order
			end
		end

		context "admin is not signed in" do
			it "returns status code 302 when admin is not signed in" do
				get :index
				expect(response).to have_http_status(302)
			end
			it "returns status code 302 when user tries to access" do
				sign_in @user
				get :index
				expect(response).to have_http_status(302)
			end
			it "redirects to main page" do
				get :index
				expect(response).to redirect_to root_path
			end
		end

	end

end
