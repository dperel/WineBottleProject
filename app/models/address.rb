class Address < ActiveRecord::Base
  
  require 'bitcoin'
  require 'awesome_print'

  belongs_to :user
  belongs_to :vineyard 
  has_many :histories

  geocoded_by :stringified_location
  after_validation :geocode

  has_attached_file :avatar, 
                    :styles => {:medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  validates_presence_of :vineyard_name, 
                        :wine_type, 
                        :vintage, 
                        :provenance
  
  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key,
                :stringified_location

  Bitcoin.network = :testnet3

  def transfer_old_attributes(sending_address)
    old_address = sending_address
    new_address = self 
    attrs_for_transfer = ["vineyard_name", "wine_type", "vintage", "provenance",
                          "brand_name", "stringified_location", "designation", "stringified_description", 
                          "avatar_file_name", "avatar_content_type", "avatar_file_size", "avatar_updated_at"]
    new_address.attributes.each do |key, value|
      new_address.send("#{key}=", sending_address.attributes[key]) if attrs_for_transfer.include?(key) 
    end
  end

  def assign_last_location(params)
    receiver = User.find(params["address"]["current_user"])
    receiver.stringified_location = "#{receiver.city}, #{receiver.state},#{receiver.country}"
    self.stringified_location = receiver.stringified_location
    self.save
  end

  def generate_btc_address_and_keys 
    key_pair = Bitcoin::generate_key
    self.private_key = key_pair[0]
    self.public_key = key_pair[1]
    self.btc_address = Bitcoin::pubkey_to_address(key_pair[1])
  end
  
end
