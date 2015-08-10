class Transaction < ActiveRecord::Base

  require 'chain'

  attr_accessor :chain_client 

  belongs_to :user

  ANGELS_SHARE = 10000 # in satoshis

  def make_transaction(receiver_id, bottle_description, params)
    receiver_address(receiver_id, bottle_description)
    transfer_balance(params)
    change_to_sold(params)
  end

  def receiver_address(receiver_id, bottle_description)
    @address = Address.new
    @address.last_location = User.find(receiver_id]).stringified_location 
    @address.user_id = receiver_id
    @address.description = bottle_description
    @address.generate_btc_address_and_keys
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
