class AddressMaker

  require 'bitcoin'

  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key

  Bitcoin.network = :testnet3

  def initialize
     @key_pair = Bitcoin::generate_key
     @priv_key = @key_pair[0]
     @pub_key = @key_pair[1]
     @address = Bitcoin::pubkey_to_address(@pub_key)
  end

end