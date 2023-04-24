class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    execute 'CREATE SEQUENCE products_internal_id_seq START 000001'
    create_table :products, id: :uuid do |t|
      t.string :name, null: true
      t.string :description, null: false
      t.integer :internal_id, null: false, default: lambda {
        "nextval('products_internal_id_seq')"
      }
      t.decimal :purchase_price, default: 0, null: false
      t.decimal :sale_price, default: 0, null: false
      t.references :brand, null: false, foreign_key: true, type: :uuid
      t.integer :stock_quantity, default: 0, null: false
      t.integer :min_stock_quantity, default: 0, null: false
      t.integer :max_stock_quantity, default: 0, null: false
      t.integer :status
      t.references :base_measurement_unit, null: false, foreign_key: true, type: :uuid
      t.references :product_presentation, null: false, foreign_key: true, type: :uuid
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :products, :deleted_at
  end
end
