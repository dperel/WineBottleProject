class Transaction < ActiveRecord::Base
  belongs_to :user

  # Sends the transaction data to the bitcoin network, but does not store anything in the database
  
  # The point of this model is: 
  # 1. take sender address and user address
  # 2. Submit a transaction request to the BTC network 
  # 3. Return a confirmation to somewhere 
end
