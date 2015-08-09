class WineFaucet < ActiveRecord::Base

  def self.transfer_balance(new_address)
    faucet_address = "mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ"  
    faucet_private_key = ENV['faucet_key_secret']
    new_chain_client = Chain::Client.new(key_id: '363d6e562d4c76b4f0ddc636934d71e3', key_secret: ENV['key_secret'])
    new_chain_client.block_chain = 'testnet3'
    new_chain_client.transact(
      inputs: 
      [ 
        { 
          address: faucet_address,
          private_key: faucet_private_key
        }
      ],
          outputs: 
      [
        {
          address: new_address.btc_address,
          amount: 100000
        }
      ]
    )
  end

end

