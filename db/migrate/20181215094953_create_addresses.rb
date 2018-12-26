class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user,       null: false, foreign_key: true
      t.integer :post_number,   null: false
      t.references :prefecture, null: false, foreign_key: true
      t.string  :city,          null: false
      t.string  :address,       null: false
      t.string  :building
      t.integer :building_tel
      t.timestamps
    end
  end
end
