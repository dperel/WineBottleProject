class Address < ActiveRecord::Base
  
  require 'bitcoin'

  before_create :randomize_file_name
  after_initialize :set_bitcoin_network # sets Bitcoin network environment; default for development is testnet

  belongs_to :user
  belongs_to :vineyard 
  has_many :histories

  validates_presence_of :vineyard_name, 
                        :wine_type, 
                        :vintage, 
                        :provenance
  
  attr_accessor :address, 
                :key_pair,
                :priv_key,
                :pub_key, 
                :stringified_location

  # Geocoder helpers:
  geocoded_by :stringified_location
  after_validation :geocode

  # Paperclip attributes:
  has_attached_file :avatar, 
                    :styles => {:medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png",
                    :path => ":rails_root/public/addresses/avatars/:basename_:style.:extension",
                    :url => "/addresses/avatars/:basename_:style.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
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
    self.current_location = receiver.stringified_location
    self.save
  end

  def generate_btc_address_and_keys # sets Bitcoin address and a key pair using Bitcoin API
    key_pair = Bitcoin::generate_key
    self.private_key = key_pair[0]
    self.public_key = key_pair[1]
    self.btc_address = Bitcoin::pubkey_to_address(key_pair[1])
  end

  private
    def randomize_file_name # allows to avoid a problem with user uploading files with identical names to database
      extension = File.extname(avatar_file_name).downcase
      self.avatar.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
    end

    def set_bitcoin_network
      Bitcoin.network = :testnet3
    end
  
end
