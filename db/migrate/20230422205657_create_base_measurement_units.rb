class CreateBaseMeasurementUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :base_measurement_units, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :base_measurement_units, :deleted_at
  end
end
