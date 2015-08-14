class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_filter :configure_user_location, :only => :create, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, 
                                                            :email, 
                                                            :city, 
                                                            :state, 
                                                            :country, 
                                                            :business_name, 
                                                            :password, 
                                                            :is_vineyard) 
                                                            }
  end

  def configure_user_location
    @user.assign_stringified_location
  end

end