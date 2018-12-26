class AddColumnItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :condition, :references, null: false, foreign_key: true
    add_column :items, :user, :references, null: false, foreign_key: true
    add_column :items, :postage, :references, null: false, foreign_key: true
    add_column :items, :delivery_method, :references, null: false, foreign_key: true
    add_column :items, :prefecture, :references, null: false, foreign_key: true
    add_column :items, :delivery_day, :references, null: false, foreign_key: true
    add_column :items, :price, :integer, null: false
    add_column :items, :brand, :references, foreign_key: true,default: 1
    add_column :items, :likes_count, :integer, default: 0
    add_column :items, :category, :references, null: false, foreign_key: true
    add_column :items, :item_state, :references, null: false, foreign_key: true, default: 1
    add_column :items, :size, :references, foreign_key: true,default: 1
  end
end
