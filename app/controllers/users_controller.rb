class UsersController < ApplicationController
  
  attr_accessor :user
                # :user_addresses

  def create
    @user = User.new(user_params)
    @user.save ? (redirect_to @user) : (redirect_to '/users/new')
  end

  def show # see your cellar
    @user = current_user
    assign_stringified_location
    assign_cellar
    @all_users = User.all # for a drop-down for selling bottles
  end

  # helper methods for show
  def assign_stringified_location
    @user = current_user
    if @user.state.present? 
      @user.stringified_location = "#{@user.city}, #{@user.state}, #{@user.country}"
    else 
      @user.stringified_location = "#{@user.city}, #{@user.country}"
    end
    @user.save
  end

  def assign_cellar
    @current_bottles = current_user.current_bottles
    @former_bottles = current_user.former_bottles
  end

  private

    def user_params
      params.require(:id)
    end

end 

