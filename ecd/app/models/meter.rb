class Meter < ActiveRecord::Base
  belongs_to :building_id
  belongs_to :meter_type_id
end
