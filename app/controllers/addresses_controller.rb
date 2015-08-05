class AddressesController < ApplicationController

require 'bitcoin'

  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key

  Bitcoin.network = :testnet3

  def initialize
     @key_pair = Bitcoin::generate_key
     @priv_key = @key_pair[0]
     @pub_key = @key_pair[1]
     @btc_address = Bitcoin::pubkey_to_address(@pub_key)
  end

  def new # following pressing a 'create new address' button
    address = Address.new
    address.private_key = @priv_key
    address.public_key = @pub_key
    address.btc_address = @btc_address
    address.user_id = current_user.id
    address.save

    if address.save
      # binding.pry
      redirect_to user_path(current_user)
    else 
      redirect_to '/addresses/new'
    end
  end 

  #Task to be done tomorrow 
  # def check_balance
  #   @balance = @chain_client.get_address(@address)
  # end


  def index
  end

  private

  def address_params
    params.require(:address).permit(:name)
  end

end
