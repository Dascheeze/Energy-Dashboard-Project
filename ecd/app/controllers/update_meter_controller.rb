class UpdateMeterController < ApplicationController

  def addDataPoint(series, value)
    newData = Data.new
    newData.series_id = series
    newData.amount = value
	newData.save
  end
  
  def index
    addDataPoint(1, 40)
    Meter.all() do |onemeter| 
	  parse_xml(onemeter.modbus_address,onemeter.id)
    end
	respond_to do |format|
		format.html
	end
  end
end
