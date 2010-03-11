class CreatePowerUnits < ActiveRecord::Migration
  def self.up
    create_table :power_units do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :power_units
  end
end
