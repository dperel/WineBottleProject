class Address < ActiveRecord::Base

  belongs_to :user
  belongs_to :vineyard 
  
  require 'bitcoin'

  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key

  Bitcoin.network = :testnet3

  def generate_btc_address_and_keys #will take description as argument
     key_pair = Bitcoin::generate_key
     self.description = "THIS IS FRRRAANZIA."
     self.private_key = key_pair[0]
     self.public_key = key_pair[1]
     self.btc_address = Bitcoin::pubkey_to_address(@pub_key)
     self.save
  end

# The point of this model should be: 
# 1. Create a BTC address (bottle holder) and link it to a bottle serial number
# 2. Check the balance of any BTC address (bottle holder) to see if it contains the bottle 

end
