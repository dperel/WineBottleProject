class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new
    sending_address_object = Address.where(btc_address: params[:address][:sending_btc_address])
    sending_address = sending_address_object[0]
    receiver_id = params[:address][:user_id]
    @transaction.make_transaction(sending_address, receiver_id, params)
    
    redirect_to user_path(current_user)
  end

  def show
  end

end
