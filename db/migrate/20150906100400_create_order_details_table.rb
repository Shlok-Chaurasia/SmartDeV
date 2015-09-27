class CreateOrderDetailsTable < ActiveRecord::Migration
def change
  create_table :customer_order_details do |t|
    t.column :product_stock_id, :integer
    t.belongs_to :customer_order
    t.column :quantity, :integer, :default => 1
    t.timestamps null:false
  end
end
end
