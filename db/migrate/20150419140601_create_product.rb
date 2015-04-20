class CreateProduct < ActiveRecord::Migration

  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :category_type, :string
      t.column :seller_id, :integer
      t.column :price, :float
      t.column :image_url, :string
      t.timestamps null:false
    end

  end
end
