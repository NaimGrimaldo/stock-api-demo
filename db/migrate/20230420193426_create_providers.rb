class CreateProviders < ActiveRecord::Migration[7.0]
  def up
    execute 'CREATE SEQUENCE providers_internal_id_seq START 000001'
    create_table :providers, id: :uuid do |t|
      t.string :legal_name
      t.string :nickname, null: false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :maternal_last_name
      t.date :birth_date
      t.string :email, null: false
      t.string :phone, null: false
      t.string :website
      t.string :rfc
      t.string :curp
      t.string :nationality
      t.integer :internal_id, null: false, default: lambda {
        "nextval('providers_internal_id_seq')"
      }
      t.date :starts_on
      t.integer :provider_type, null: false

      t.timestamps
      t.datetime :deleted_at 
    end
    add_index :providers, :deleted_at
  end
end
