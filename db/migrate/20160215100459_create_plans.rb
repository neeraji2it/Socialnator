class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.decimal :followers
      t.decimal :likes
      t.float :followers_price
      t.float :likes_price

      t.timestamps null: false
    end
  end
end
