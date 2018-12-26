class CreateItemComments < ActiveRecord::Migration[5.1]
  def change
    create_table :item_comments do |t|
      t.text     :comment, null: false
      t.references  :user, null: false, foregin_key: true
      t.references  :item, null: false, foregin_key: true
      t.timestamps
    end
  end
end
