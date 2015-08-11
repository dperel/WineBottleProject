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
                        :city, 
                        :country

  # validates_uniqueness_of :email Devise takes care of that

  def current_bottles
    addresses.where(is_sold: false)
  end

  def former_bottles
    addresses.where(is_sold: true)
  end

end
