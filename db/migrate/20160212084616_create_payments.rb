class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :user_id
      t.integer :user_transaction_id
      t.string  :ip_address
      t.string  :first_name
      t.string  :last_name
      t.string  :action
      t.decimal :amount
      t.boolean :success
      t.string  :authorization
      t.string  :message
      t.text    :params
      t.string :express_token
      t.string :express_payer_id

      t.timestamps null: false
    end
  end
end
