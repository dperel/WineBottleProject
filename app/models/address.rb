class Address < ActiveRecord::Base

  require 'bitcoin'
  require "awesome_print"

  belongs_to :user
  belongs_to :vineyard 

  validates_presence_of :vineyard_name, 
                        :wine_type, 
                        :vintage, 
                        :provenance
  
  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key

  Bitcoin.network = :testnet3

  def generate_btc_address_and_keys 
     key_pair = Bitcoin::generate_key
     self.private_key = key_pair[0]
     self.public_key = key_pair[1]
     self.btc_address = Bitcoin::pubkey_to_address(key_pair[1])
     self.save
  end
  
end
