class AddressesController < ApplicationController

  require 'bitcoin'
  Bitcoin.network = :testnet3

  def create  # following pressing 'register a new bottle' and then 'submit'
    @address = Address.new
    @address.user_id = current_user.id
    @address.assign_attributes_from_params(params)
    @address.assign_last_location(params)
    @address.create_stringified_description
    key_pair = Bitcoin::generate_key
    @address.private_key = key_pair[0]
    @address.public_key = key_pair[1]
    @address.btc_address = Bitcoin::pubkey_to_address(key_pair[1])
    
    @address.save
    new_address = @address
    WineFaucet.transfer_balance(new_address)
    redirect_to user_path(current_user)
  end

  def index
    @user_addresses = Addresses.find(params[:user_id])
  end


  private

  def address_params
    params.require(:address).permit(:avatar)
  end

end
