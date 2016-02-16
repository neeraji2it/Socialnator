class HomeController < ApplicationController
	def index
		@plan = Plan.first
	end
end
