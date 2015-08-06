class Transaction < ActiveRecord::Base

  require 'chain'

  attr_accessor :chain_client 

  belongs_to :user

  def make_transaction(receiver_id, bottle_description, params)
    receiver_address(receiver_id, bottle_description)
    transfer_balance(params)
  end


  def receiver_address(receiver_id, bottle_description)
    @address = Address.new
    @address.user_id = receiver_id
    @address.description = bottle_description
    @address.generate_btc_address_and_keys
    @address.save
  end

  def transfer_balance(params)
    sender_address = params[:address][:sending_btc_address]
    sender_private_key = params[:address][:sending_private_key]
    new_chain_client = Chain::Client.new(key_id: 'a9c71386c1e7d619906f66c1ad13f01d', key_secret: ENV['key_secret'])
    new_chain_client.block_chain = 'testnet3'
    new_chain_client.transact(

        inputs: [ 
          {
            address: sender_address,
            private_key: sender_private_key
          }
          ],
        outputs: [
          {
            address: @address.btc_address,
            amount: 0.00001
          }
        ]
      )
  end
  
end
