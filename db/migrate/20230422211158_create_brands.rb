class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :brands, :deleted_at
  end
end
