class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :freight
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
