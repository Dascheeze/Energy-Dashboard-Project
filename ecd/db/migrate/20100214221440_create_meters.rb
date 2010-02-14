class CreateMeters < ActiveRecord::Migration
  def self.up
    create_table :meters do |t|
      t.belongs_to :building_id
      t.belongs_to :meter_type_id
      t.integer :modbus_address
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :meters
  end
end
