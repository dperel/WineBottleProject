class AddressesController < ApplicationController

  require 'bitcoin'
  Bitcoin.network = :testnet3

   def new # following pressing a 'create new address' button
    @address = Address.new
    @address.user_id = current_user.id
    @address.description = "FRANZIA"
    @address.generate_btc_address_and_keys
    if @address.save
      redirect_to user_path(current_user)
    else 
      redirect_to '/addresses/new'
    end
  end 

  def create
    @address = Address.new
    @address.user_id = current_user.id
    @address.description = params["address"]["description"]
    key_pair = Bitcoin::generate_key
    @address.private_key = key_pair[0]
    @address.public_key = key_pair[1]
    @address.btc_address = Bitcoin::pubkey_to_address(key_pair[1])
    @address.save
    new_address = @address
    WineFaucet.transfer_balance(new_address)
    # binding.pry
    redirect_to user_path(current_user)
  end

  def index
    @user_addresses = Addresses.find(params[:user_id])
  end

  private

  def address_params
    params.require(:address).permit(:name)
  end

end
