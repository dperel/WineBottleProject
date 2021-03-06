class Transaction < ActiveRecord::Base

  require 'chain'

  attr_accessor :chain_client 

  belongs_to :user

  ANGELS_SHARE = 10000 

  def make_transaction(previous_address, recipient, params)
    receiver_address(previous_address, recipient) # calls one method
    assign_location(recipient) # calls another method
    transfer_balance(params)
    change_to_sold(params) # calls another method
    MakeHistory.run
  end

  def receiver_address(previous_address, recipient)
    @address = Address.new
    @address.generate_btc_address_and_keys
    @address.current_location = recipient.stringified_location 
    @address.avatar = previous_address.avatar 
    @address.user_id = recipient.id
    @address.transfer_old_attributes(previous_address)
    @address.save
  end


  def assign_location(recipient)
    @address.current_location = recipient.stringified_location
    lat_long = Geocoder.coordinates(@address.current_location)
    @address.latitude = lat_long[0]
    @address.longitude = lat_long[1]
    @address.save
  end

  def transfer_balance(params)
    sender_address = params[:address][:sending_btc_address]
    sender_private_key = params[:address][:sending_private_key]
    chain_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', key_secret: ENV["key_secret"])
    chain_client.block_chain = 'testnet3'
    current_address_info = chain_client.get_address(sender_address)
    balance = current_address_info[0]["confirmed"]["balance"]
    if balance == 0
     false
    else
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
  end

  def change_to_sold(params)
    target = Address.where(btc_address: params[:address][:sending_btc_address])
    target[0][:is_sold] = true
    target[0].save
  end

  def self.get_balance(previous_btc)
    chain_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', key_secret: ENV["key_secret"])
    chain_client.block_chain = 'testnet3'
    current_address_info = chain_client.get_address(previous_btc)
    balance = current_address_info[0]["confirmed"]["balance"]
    if balance == 0 
      return false
    else 
      return true 
    end
  end
  
end
