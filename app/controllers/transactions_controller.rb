class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new
    sending_address_id = @transaction.sending_address(params)
    receiver_id = @transaction.receiver_id(params)
    @transaction.make_transaction(sending_address_id, receiver_id, params)
    redirect_to user_path(current_user)
  end

  def show
  end

end
