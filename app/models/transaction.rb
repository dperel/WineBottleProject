class Transaction < ActiveRecord::Base

  require 'chain'

  belongs_to :user

  attr_accessor :chain_client 

  def chain_client
    @chain_client ||= ChainWrapper.new
  end

  #what am i sending? 
        # addresses with 0 balance are past bottles
      # bitcoin balance of sfdsgdsgf to reciever, reset to 0 from sender 
      # receiver gets NEW address that matches original description

  #who am i sending it to?

  # def make_transaction
  #   sender_address = current_user.addresses.first
  #   sender_priv_key = 'd3d135d1eabfa5510803ccc508cf66835bc321c7548d5e54a8679d26c18763c9'
  #   receiver = Address_Maker.new
  #   #User find by id.addresses << address_maker.new
  #   receiver_address = receiver.address
  #   puts "Receiver Address"
  #   puts receiver_address
  #   puts "Receiver Private Key"
  #   puts receiver.priv_key
  #   puts "Receiver Public Key"
  #   puts receiver.pub_key
  #   puts "Chain Client:"
  #   chain_client.transact(
  #     inputs: [ 
  #       {
  #         address: sender_address,
  #         private_key: sender_priv_key
  #       }
  #       ],
  #     outputs: [
  #       {
  #         address: receiver_address,
  #         amount: 0.001
  #       }
  #     ]
  #   )
  # end

  def make_transaction(receiver_id, bottle_description, params)
    receiver_address(receiver_id, bottle_description)
    transfer_balance(params, chain_client)
  end

  def receiver_address(receiver_id, bottle_description)
    @address = Address.new
    @address.user_id = receiver_id
    @address.description = bottle_description
    @address.generate_btc_address_and_keys
    @address.save
  end

  def transfer_balance(params, chain_client)
    sender_address = params[:address][:sending_btc_address]
    sender_private_key = params[:address][:sending_private_key]
    new_chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
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
