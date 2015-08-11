class UsersController < ApplicationController
  
  attr_accessor :user, 
                :user_addresses

  # WE DON'T NEED THIS, DO WE?              
  # def new 
  #   @user = User.new
  # end

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

  # def stringified_description
  #   @user.stringified_description = 
  # end

  # see your cellar
  def show
    @user = current_user
    check_for_blank_stringified_location
    # if @user.stringified_location.blank? 
    #   @user.stringified_location = "#{@user.city}, #{@user.state}, #{@user.country}"
    #   @user.save
    # end
    binding.pry
    assign_cellar
    # can we just replace this with current_user?
    # @current_bottles = current_user.current_bottles
    # @former_bottles = current_user.former_bottles
    # do we need to call this?
    @all_users = User.all
  end

  def check_for_blank_stringified_location
    @user = current_user
    if @user.stringified_location.blank? 
      @user.stringified_location = "#{@user.city}, #{@user.state}, #{@user.country}"
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

