class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string  :order_type
      t.string  :status
      t.string  :url
      t.integer :order_count
      t.string  :ordid

      t.timestamps null: false
    end
  end
end
