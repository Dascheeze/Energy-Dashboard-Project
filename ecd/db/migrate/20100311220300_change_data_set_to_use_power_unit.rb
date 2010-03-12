class ChangeDataSetToUsePowerUnit < ActiveRecord::Migration
  def self.up
    change_column :data_sets, :units, :integer
  end

  def self.down
    change_column :data_sets, :units, :string
  end
end
