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
     @user = User.find(user_params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_vineyard)
  end

end 

