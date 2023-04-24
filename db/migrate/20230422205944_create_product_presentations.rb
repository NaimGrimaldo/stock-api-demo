class CreateProductPresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :product_presentations, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :factor_per_item, null: false, default: 1
      t.string :nickname
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :product_presentations, :deleted_at
  end
end
