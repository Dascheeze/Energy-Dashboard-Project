class DataSetIdToInteger < ActiveRecord::Migration
  def self.up
    change_column :data_points, :data_set_id, :integer
  end

  def self.down
    change_column :data_points, :data_set_id, :belongs_to
  end
end
