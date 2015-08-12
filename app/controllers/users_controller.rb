class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    @user.save ? (redirect_to @user) : (redirect_to '/users/new')
  end

  def show # after clicking 'see your cellar'
    @user = current_user
    assign_stringified_location
    assign_cellar
    @users = User.all_except_current(current_user) # for a drop-down menu for selling bottles
  end

  # helper method for show
  def assign_stringified_location
    @user = current_user
    if @user.state.present? 
      @user.stringified_location = "#{@user.city}, #{@user.state}, #{@user.country}"
    else 
      @user.stringified_location = "#{@user.city}, #{@user.country}"
    end
    @user.save
  end

  # helper method for show
  def assign_cellar
    @current_bottles = current_user.current_bottles
    @former_bottles = current_user.former_bottles
  end

  private

    def user_params
      params.require(:user).permit(:id, 
                                  :name, 
                                  :email, 
                                  :password, 
                                  :city, 
                                  :state, 
                                  :country, 
                                  :business_name, 
                                  :stringified_location, 
                                  :is_vineyard
                                  )
    end

end 

