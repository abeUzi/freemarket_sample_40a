class CreateDeliveryDays < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_days do |t|
      t.string     :day, null: false
      t.timestamps
    end
  end
end