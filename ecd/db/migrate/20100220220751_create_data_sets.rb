class CreateDataSets < ActiveRecord::Migration
  def self.up
    create_table :data_sets do |t|
      t.belongs_to :meter
      t.integer :point_number
      t.string :name
      t.string :units

      t.timestamps
    end
  end

  def self.down
    drop_table :data_sets
  end
end
