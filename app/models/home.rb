class Home < ActiveRecord::Base
  
  def user
    @user = User.find(params[:id])
  end

end
