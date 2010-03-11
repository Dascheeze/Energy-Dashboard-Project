class DataSet < ActiveRecord::Base
  belongs_to :meter
  belongs_to :power_unit
end
