class WineFaucet < ActiveRecord::Base


  def self.transfer_balance(new_address)
      faucet_address = "mgEZRfavVcZ3MHkYSwfQGD2S2eZWZ7wdsZ"  
      faucet_private_key = #secret
      new_chain_client = #don't write it here 
      new_chain_client.block_chain = 'testnet3'
      new_chain_client.transact(

          inputs: [ 
            {
              address: faucet_address,
              private_key: faucet_private_key
            }
            ],
          outputs: [
            {
              address: new_address.btc_address,
              amount: 0.00001
            }
          ]
        )
  end

end

