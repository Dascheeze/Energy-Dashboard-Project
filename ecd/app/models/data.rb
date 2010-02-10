class Data < ActiveRecord::Base
  belongs_to :meter_type
  belongs_to :building
end
