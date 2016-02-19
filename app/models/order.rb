class Order < ActiveRecord::Base
  belongs_to :user
  validates :url, :presence => :true
  before_create :order_number?
  
  def order_number?
    numbers = (0..9).to_a
    pn= 'ORD' + '-' + numbers[rand(10)].to_s+numbers[rand(10)].to_s+numbers[rand(10)].to_s+numbers[rand(10)].to_s
    self.ordid = pn
  end
end
