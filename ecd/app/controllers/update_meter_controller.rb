class UpdateMeterController < ApplicationController
  def index
    $meters = Meter.all
	$meters.each {|onemeter| 
	  parse_xml onemeter.modbus_address onemeter.id
    }
	respond_to do |format|
		format.html
	end
  end
end
