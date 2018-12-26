class CreateTransactionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_comments do |t|
      t.references  :user, null: false, foreign_key: true
      t.text     :comment
      t.references  :transaction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
