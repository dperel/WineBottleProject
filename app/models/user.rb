class User < ActiveRecord::Base

  has_many :addresses
  has_many :transctions

  attr_accessor :address

  # The point of this model is: 
  # 1. Create a user account using Devise
  # 2. Edit personal detail
  self.address = Address.new

end
