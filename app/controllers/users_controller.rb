class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show]

  def index
  end

  def show
  end
  
  def new
  end

  def create
  end
end
