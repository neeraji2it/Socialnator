class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	respond_to do |format|
      format.html
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  end

  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(new_params.merge(:user_id => current_user.id, :status => "in process"))
  	if @order.save
  		redirect_to orders_path
  	else
  		render :action => 'new'
  	end
  end

  private
  def new_params
  	params.require(:order).permit!
  end
end
