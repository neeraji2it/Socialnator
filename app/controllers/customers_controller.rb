class CustomersController < ApplicationController
	def index
		@users = User.where("role != 'admin'")
	end

	def set_price
		@user = User.find(params[:id])
		@plan = Plan.new
	end
	def edit_price
		@plan = Plan.find(params[:id])
	end
	def price_set
		@user = User.find(params[:id])
		@plan = Plan.new(new_params.merge(:user_id => @user.id))
		if @plan.save
			respond_to do |format|
				format.js
			end
		end
	end
	def update_price
		@plan = Plan.find(params[:id])
		if @plan.update_attributes(new_params)
			respond_to do |format|
				format.js
			end
		end
	end

	private

	 def new_params
	 	params.require(:plan).permit!
	 end
end
