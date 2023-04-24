class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :legal_name
      t.string :nickname, null: false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :maternal_last_name
      t.date :birth_date
      t.string :email
      t.string :phone
      t.integer :gender
      t.string :rfc
      t.string :curp
      t.string :nationality
      t.integer :customer_type, null: false

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :customers, :deleted_at
  end
end
