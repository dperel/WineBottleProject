class Transaction < ActiveRecord::Base

  attr_accessor :chain_client 
  belongs_to :user
  require 'chain'
  

  def chain_client
    @chain_client ||= ChainWrapper.new
  end

  def make_transaction
    sender_address = current_user.addresses.first
    sender_priv_key = 'd3d135d1eabfa5510803ccc508cf66835bc321c7548d5e54a8679d26c18763c9'
    receiver = Address_Maker.new
    receiver_address = receiver.address
    puts "Receiver Address"
    puts receiver_address
    puts "Receiver Private Key"
    puts receiver.priv_key
    puts "Receiver Public Key"
    puts receiver.pub_key
    puts "Chain Client:"
    chain_client.transact(
      inputs: [ 
        {
          address: sender_address,
          private_key: sender_priv_key
        }
        ],
      outputs: [
        {
          address: receiver_address,
          amount: 0.001
        }
      ]
    )
  end


  # Sends the transaction data to the bitcoin network, but does not store anything in the database
  
  # The point of this model is: 
  # 1. take sender address and user address
  # 2. Submit a transaction request to the BTC network 
  # 3. Return a confirmation to somewhere 
end
