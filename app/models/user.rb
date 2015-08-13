class User < ActiveRecord::Base


  attr_accessor :address

  has_many :addresses
  has_many :transactions

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

  scope :all_except_current, ->(user) { where.not(id: user) }

  def assign_stringified_location # assigns stringified_location attribute from the attributes with which the user was created
    if self.state.present? 
      self.stringified_location = "#{self.city}, #{self.state}, #{self.country}"
    else 
      self.stringified_location = "#{self.city}, #{self.country}"
    end
    self.save
  end

  def current_bottles
    addresses.where(is_sold: false)
  end

  def former_bottles
    addresses.where(is_sold: true)
  end

end
