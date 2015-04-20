class CreateProductStock < ActiveRecord::Migration
  def change
    create_table :product_stocks do |t|
      t.belongs_to :product
      t.column :available_stock_in_grams, :float
      t.column :is_available, :boolean
      t.timestamps null:false
    end

  end
end
