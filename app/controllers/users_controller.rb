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
  end

  def show
     @user = current_user
     @current_bottles = current_user.addresses.where(is_sold: false)
     @former_bottles = current_user.addresses.where(is_sold: true)
     @all_users = User.all
  end

  private

  def user_params
    params.require(:id)
  end

end 

