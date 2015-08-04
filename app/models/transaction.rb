class Transaction < ActiveRecord::Base
  require 'chain'
  require 'bitcoin'

  belongs_to :user

  Bitcoin.network = :testnet3

  def tx_info_to_json
    # sender = AddressMaker.new
    sender_address = '17x23dNjXJLzGMev6R63uyRhMWP1VHawKc'
    receiver = AddressMaker.new
    receiver_address = receiver.address
    chain_client.transact(
      inputs: [ 
        {
          address: sender_address,
          private_key: sender.priv_key
        }
        ],
      outputs: [
        {
          address: receiver_address,
          amount: 2
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
