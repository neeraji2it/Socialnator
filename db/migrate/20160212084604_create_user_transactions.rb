class CreateUserTransactions < ActiveRecord::Migration
  def change
    create_table :user_transactions do |t|
    	t.decimal :amount, :default => 0.0
      t.timestamps null: false
    end
  end
end
