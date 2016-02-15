class HomeController < ApplicationController
	def index
		@plan = Plan.first
	end

	def post_plan
		@plan = Plan.first
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
