class AddProductDescription < ActiveRecord::Migration
  def change
    create_table :product_descriptions do |t|
      t.belongs_to :product
      t.column :about, :text
      t.column :benefits, :text
      t.column :how_to_use, :text
    end
  end
end
