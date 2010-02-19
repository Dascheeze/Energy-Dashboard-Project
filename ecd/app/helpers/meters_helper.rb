module MetersHelper
  def parse_xml(modbus_address, meter_id)
    require 'rexml/document'
    include REXML
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump
  #  Series.each do |series| {
  ##    if series.meter_id == 
  #  xml_doc.elements.each("DAS/devices/device/records/record/point") { 
  ##    |element| do { 
  ##      if element.attribute["name"] == "Energy Consumption"
  #        @data_point_ec = Data.new
  ##        data_point_ec.amount = element.attribute["value"]
  #        data_point_ec.unit = element.attribute["units"]
  ##        data_point_ec.save
  #      else if element.attribuet["name"] == "Apparent Power"
  #        @data_point_ap = Data.new
  #      end
  #  } # Okay, so what I'm gonna wanna do now is toset up a for each loop to go through all of the series to check the
  #  # point numbers against the points after checking if the meter_ids match up.  Then, call data_create or whatever it was
  #  # # to generate a new data point.
  #  }

    Series.each do |series| {
      if series.meter_id == meter_id
        if series.point_number == 0
          xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
            if ele.attribute["number"] == 0
              @data_point_ec = Data.new
              data_point_ec.amount = ele.attribute["value"]
              data_point_ec.series_id = series.id
              data_point.ec.save
            else if ele.attribute["number"] == 1
              @data_point_rp = Data.new
              data_point_rp.amount = ele.attribute["value"]
              data_point_rp.series_id = series.id
              data_point.rp.save
            end
          end
        end
      end
    }
    end
  end

end
