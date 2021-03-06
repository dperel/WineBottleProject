class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new
    previous_address = Address.where(btc_address: params[:address][:sending_btc_address]).first
    previous_btc = previous_address.btc_address
    if Transaction.get_balance(previous_btc)
      if params[:address][:user_id].blank? # cannot sell to no listed user
        redirect_to request.referrer
        flash[:notice] = "Please choose a user."
      else # if there is a valid recipient
        recipient = User.find(params[:address][:user_id])
        @address = Address.new
        @address.generate_btc_address_and_keys
        @transaction.make_transaction(previous_address, recipient, params)
        redirect_to request.referrer
      end 
    else 
      redirect_to request.referrer
      flash[:notice] = "This bottle has not been recorded in the blockchain yet. Please wait a couple of minutes."
    end 
  end 
end

