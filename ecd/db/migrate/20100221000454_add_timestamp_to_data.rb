class AddTimestampToData < ActiveRecord::Migration
  def self.up
    change_table :datas do |t|
      t.timestamps
    end
  end

  def self.down
  end
end
