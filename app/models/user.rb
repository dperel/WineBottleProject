class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable

  has_many :addresses
  has_many :transactions

  validates_presence_of :name, :city, :country

  attr_accessor :address

  def self.current_bottles(current_user)
    current_user.addresses.where(is_sold: false)
  end

  def self.former_bottles(current_user)
    current_user.addresses.where(is_sold: true)
  end

  def show
  end
  # The point of this model is: 
  # 1. Create a user account using Devise
  # 2. Edit personal detail

end
