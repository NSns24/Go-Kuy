class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def profile
  end

  def order
  end
end
