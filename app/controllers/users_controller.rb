class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    @user.assign_stringified_location
    @user.save ? (redirect_to @user) : (redirect_to '/users/new')
  end

  def show # see your cellar
    @user = current_user
    @current_bottles = current_user.current_bottles
    @former_bottles = current_user.former_bottles
    @all_users = User.all # for a drop-down for selling bottles
  end


  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :city, :state, :country, :business_name, :stringified_location, :is_vineyard )
    end

end 

