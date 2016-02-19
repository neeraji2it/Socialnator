class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	respond_to do |format|
      format.html
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  end

  def new
  	@follower = Order.new
    @like = Order.new
    @all = Order.new
  end

  def create
  	@follower = Order.new(new_params.merge(:user_id => current_user.id, :status => "in process"))
    @like = Order.new(new_params.merge(:user_id => current_user.id, :status => "in process"))
    @all = Order.new
    @order = params[:order][:order_type] == 'followers' ? @follower : @like
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
