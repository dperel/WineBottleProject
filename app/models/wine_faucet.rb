class WineFaucet < ActiveRecord::Base
# makes new wine bottles from the master bottle, drawing from the testnet stash

  attr_accessor :faucet_address, 
                :faucet_private_key

  def self.transfer_balance(new_address)
    set_faucet_address_and_private_key
    new_chain_client = Chain::Client.new(key_id: '0465c861f92619e87714a3f1b9bad5bb', key_secret: ENV['key_secret'])
    new_chain_client.block_chain = 'testnet3'
    new_chain_client.transact(
      inputs: 
      [ 
        { 
          address: @faucet_address,
          private_key: @faucet_private_key
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

  def self.set_faucet_address_and_private_key
    @faucet_address = "mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ"  
    @faucet_private_key = ENV['faucet_key_secret']
  end
  
end