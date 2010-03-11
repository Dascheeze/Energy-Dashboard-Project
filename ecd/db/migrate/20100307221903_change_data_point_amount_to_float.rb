class ChangeDataPointAmountToFloat < ActiveRecord::Migration
  def self.up
    change_column :data_points, :amount, :float
  end

  def self.down
    change_column :data_points, :amount, :decimal
  end
end
