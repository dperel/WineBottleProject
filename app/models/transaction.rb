class Transaction < ActiveRecord::Base

  require 'chain'

  attr_accessor :chain_client 

  belongs_to :user

  ANGELS_SHARE = 10000 

  def make_transaction(sending_address, receiver_id, params)
    receiver_address(sending_address, receiver_id) # calls one method
    assign_location(receiver_id) # calls another method
    transfer_balance(params) # calls another method
    change_to_sold(params) # calls another method
  end

  def receiver_address(sending_address, receiver_id)
    @address = Address.new
    @address.generate_btc_address_and_keys
    @address.current_location = User.find(receiver_id).stringified_location 
    @address.user_id = receiver_id
    @address.transfer_old_attributes(sending_address)
    @address.save
  end


  def assign_location(receiver_id)
    @address.current_location = User.find(receiver_id).stringified_location
    lat_long = Geocoder.coordinates(@address.current_location)
    @address.latitude = lat_long[0]
    @address.longitude = lat_long[1]
    @address.save
  end

  def transfer_balance(params)
    sender_address = params[:address][:sending_btc_address]
    sender_private_key = params[:address][:sending_private_key]
    chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    chain_client.block_chain = 'testnet3'
    current_address_info = chain_client.get_address(sender_address)
    balance = current_address_info[0]["confirmed"]["balance"]
    chain_client.transact(
      inputs: 
      [ 
        {
          address: sender_address,
          private_key: sender_private_key
        }
      ],
      outputs: 
      [
        {
          address: @address.btc_address,
          amount: balance.to_i - ANGELS_SHARE
        }
      ]
    )
  end

  def change_to_sold(params)
    target = Address.where(btc_address: params[:address][:sending_btc_address])
    target[0][:is_sold] = true
    target[0].save
  end
  
end
