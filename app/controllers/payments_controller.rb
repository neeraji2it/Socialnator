class PaymentsController < ApplicationController
	def express
		@transaction = UserTransaction.find(params[:transaction_id])
    response = EXPRESS.setup_purchase(@transaction.amount * 100,
      :ip => request.remote_ip,
      :return_url => new_payment_url(:transacton_id => @transaction.id),
      :cancel_return_url => root_url,
      :allow_note => true
    )
    redirect_to EXPRESS.redirect_url_for(response.token)
  end

  def new
  	@transaction = UserTransaction.find(params[:transacton_id])
    @order = Payment.new(:express_token => params[:token])
  end

  def add_balance
  	@transaction = UserTransaction.new
  end

  def balance
  	@transaction = UserTransaction.new(new_params)
  	if @transaction.save
  		redirect_to checkout_path(@transaction)
  	end
  end

  def index
    @transactions = Payment.where("success = true")
  end

  def checkout
  	@transaction = UserTransaction.find(params[:id])
  end

  def create
    @order = Payment.new(params_order.merge(user_id: current_user.id))
    if @order.purchase && @order.success == true
    	@order.user.update_attribute(:amount, @order.user.amount + @order.amount)
      redirect_to root_path
    else
      render :action => "new"
    end
  end

  private
  def params_order
    params.require(:payment).permit!
  end
  def new_params
  	params.require(:user_transaction).permit!
  end
end
