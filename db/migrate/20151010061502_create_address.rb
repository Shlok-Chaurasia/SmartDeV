class CreateAddress < ActiveRecord::Migration
  def change
    create_table :customer_addresses do |t|
      t.column :user_id, :integer
      t.column :name, :string
      t.column :address, :string
      t.column :landmark, :string
      t.column :phone, :bigint
      t.column :zipcode, :integer
    end

  end
end
