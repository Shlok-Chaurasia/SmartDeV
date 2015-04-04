class CreateCustomer < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :user_sign_in
      t.column :name, :string
      t.column :phone, :integer
      t.column :address, :string
      t.timestamps null:false
    end
  end
end
