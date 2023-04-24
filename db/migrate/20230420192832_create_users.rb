class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    execute 'CREATE SEQUENCE users_internal_id_seq START 000001'
    create_table :users, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :maternal_last_name
      t.date :birth_date
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :gender
      t.string :rfc
      t.string :curp
      t.string :nationality
      t.integer :role
      t.integer :internal_id, null: false, default: lambda {
        "nextval('users_internal_id_seq')"
      }
      t.date :starts_on
      
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :users, :deleted_at
  end
end
