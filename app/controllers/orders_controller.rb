class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	respond_to do |format|
      format.html
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  end
end
