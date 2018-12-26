class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string   :rate, null: false
      t.references  :user, null: false, foreign_key: true
      t.text     :comment
      t.references  :transaction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
