class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new
    bottle_description = params[:address][:address_description]
    receiver_id = params[:address][:user_id]
    @transaction.make_transaction(receiver_id, bottle_description, params)
   
    redirect_to root_path
  end

  def show
  end


end
