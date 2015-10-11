class CreateSlot < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.column :zipcode, :integer
      t.column :slot_date_time, :datetime
      t.column :is_active, :boolean
    end
  end
end
