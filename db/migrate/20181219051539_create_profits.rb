class CreateProfits < ActiveRecord::Migration[5.1]
  def change
    create_table :profits do |t|
      t.references  :item, null: false, foreign_key: true
      t.integer  :delivery_cost
      t.integer  :profit
      t.timestamps
    end
  end
end
