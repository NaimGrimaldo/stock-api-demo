class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :owner, polymorphic: true, null: false, type: :uuid
      t.string :street, null: false
      t.string :exterior_number, null: false
      t.string :interior_number
      t.string :neighborhood, null: false
      t.string :municipality
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :country, null: false
      
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :addresses, :deleted_at
  end
end
