class AddressMaker

require 'bitcoin'

  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key

  Bitcoin.network = :testnet3

  # goal: 
  # 1. Generate a BTC address
  # 2. Pass it to a user or vineyard 

  def initialize
     @key_pair = Bitcoin::generate_key
     @priv_key = @key_pair[0]
     @pub_key = @key_pair[1]
     @address = Bitcoin::pubkey_to_address(@pub_key)
  end

  def check_balance

  end

end