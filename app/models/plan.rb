class Plan < ActiveRecord::Base
	belongs_to :user
	validates :followers_price, :followers, :likes_price, :likes, :presence => true
end
