class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :owner, polymorphic: true, null: false, type: :uuid
      t.references :user, null: true, foreign_key: true, type: :uuid
      t.integer :transaction_type
      t.integer :status, null: false, default: 0
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.integer :quantity
      t.decimal :total
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :transactions, :deleted_at
  end
end
