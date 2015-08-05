class UsersController < ApplicationController
  
  attr_accessor :user, 
                :user_addresses

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user
    else 
      redirect_to '/users/new'
    end
    #test line
  end

  def show
     @user = User.find(user_params)
     @user_addresses = @user.addresses
  end

  private

  def user_params
    params.require(:id)
  end

end 

