class CreateDataPoints < ActiveRecord::Migration
  def self.up
    create_table :data_points do |t|
      t.belongs_to :data_set_id
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :data_points
  end
end
