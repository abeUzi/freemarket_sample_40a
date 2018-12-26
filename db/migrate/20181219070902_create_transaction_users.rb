class CreateTransactionUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_users do |t|
      t.references  :user, null: false, foreign_key: true
      t.references  :transaction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
