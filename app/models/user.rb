class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses
  has_many :transctions

  attr_accessor :address

  # The point of this model is: 
  # 1. Create a user account using Devise
  # 2. Edit personal detail
  address = Address.new

end
