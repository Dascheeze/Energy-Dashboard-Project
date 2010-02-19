class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.belongs_to :meter_id
      t.integer :point_number
      t.string :name
      t.string :units

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
