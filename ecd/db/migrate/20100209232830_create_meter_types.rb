class CreateMeterTypes < ActiveRecord::Migration
  def self.up
    create_table :meter_types, :primary_key => :meter_type_id do |t|
      t.integer :meter_type_id
      t.string :name
      t.string :unit
      t.timestamps
    end
  end

  def self.down
    drop_table :meter_types
  end
end
