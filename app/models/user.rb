class User < ActiveRecord::Base

  attr_accessor :address

  has_many :addresses
  has_many :transactions

  require "awesome_print"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable

  validates_presence_of :name,
                        :email, 
                        :password,
                        :city, 
                        :country

  # validates_uniqueness_of :email Devise takes care of that

  def self.current_bottles(current_user)
    current_user.addresses.where(is_sold: false)
  end

  def self.former_bottles(current_user)
    current_user.addresses.where(is_sold: true)
  end

end
