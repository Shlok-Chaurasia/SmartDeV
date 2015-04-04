class CreateUserSignIn < ActiveRecord::Migration
  def change
    create_table :user_sign_ins do |t|
      t.column :user_name, :string
      t.column :email, :string
      t.column :password_digest, :string
      t.timestamps null:false
    end
  end
end
