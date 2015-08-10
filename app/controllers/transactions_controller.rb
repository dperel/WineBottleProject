class TransactionsController < ApplicationController

  def create
    # create a new instance
    @transaction = Transaction.new

    # create arguments
    sending_address = Address.where(btc_address: params[:address][:sending_btc_address]).first
    receiver_id = params[:address][:user_id]

    # call the runner and passes the arguments into it
    @transaction.make_transaction(sending_address, receiver_id, params)

    # redirect
    redirect_to user_path(current_user)
  end

  def show
  end

end
