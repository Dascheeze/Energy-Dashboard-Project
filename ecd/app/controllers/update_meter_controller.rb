class UpdateMeterController < ApplicationController
  def index
    allmeters = Meter.all
	allmeters do |onemeter| 
	  parse_xml(onemeter.modbus_address,onemeter.id)
    end
	respond_to do |format|
		format.html
	end
  end
end
