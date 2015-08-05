class AddressesController < ApplicationController

   def new # following pressing a 'create new address' button
    @address = Address.new
    @address.user_id = current_user.id

    @address.generate_btc_address_and_keys
    if @address.save
  
      redirect_to user_path(current_user)
    else 
      redirect_to '/addresses/new'
    end
  end 

  def index
    @user_addresses = Addresses.find(params[:user_id])
  end

  private

  def address_params
    params.require(:address).permit(:name)
  end

end
