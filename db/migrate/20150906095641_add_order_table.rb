class AddOrderTable < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.belongs_to :customers
      t.column :status, :string
      t.timestamps null:false
    end
  end
end
