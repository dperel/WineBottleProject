class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new
    previous_address = Address.where(btc_address: params[:address][:sending_btc_address]).first
    recipient = User.find(params[:address][:user_id]) 

    @address = Address.new
    @address.generate_btc_address_and_keys
    
    @transaction.make_transaction(previous_address, recipient, params)
    redirect_to user_path(current_user)
  end

end
