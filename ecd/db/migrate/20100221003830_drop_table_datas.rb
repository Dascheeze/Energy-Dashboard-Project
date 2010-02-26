class DropTableDatas < ActiveRecord::Migration
  def self.up
    drop_table :datas
  end

  def self.down
  end
end
