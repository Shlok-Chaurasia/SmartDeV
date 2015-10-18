class CreateProductStock < ActiveRecord::Migration
  def change
    create_table :product_stocks do |t|
      t.belongs_to :product
      t.column :available_stock, :float
      t.column :available_stock_unit, :string
      t.column :mrp, :float
      t.column :selling_price, :float
      t.column :is_available, :boolean
      t.timestamps null:false
    end

  end
end
