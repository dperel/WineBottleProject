class UsersController < ApplicationController
  
  attr_accessor :user, 
                :user_addresses

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.state.present? 
      @user.stringified_description = "#{@user.city}, #{@user.state}, #{@user.country}"
    else 
      @user.stringified_description = "#{@user.city}, #{@user.country}"
    end
    if @user.save 
      redirect_to @user
    else 
      redirect_to '/users/new'
    end
  end

  def show
    @user = current_user
    
    if @user.stringified_location.blank? 
      @user.stringified_location = "#{@user.city}, #{@user.state}, #{@user.country}"
      @user.save
    end
    
    @current_bottles = current_user.current_bottles
    @former_bottles = current_user.former_bottles
    @all_users = User.all
  end

  private

  def user_params
    params.require(:id)
  end

end 

