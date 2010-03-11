module MetersHelper
  
  def arefresh
    Meter.all.each do |meter|
      parse_xml(meter.modbus_address, meter.id)
    end
  end
  require 'net/http'
  require 'rexml/document'
  include REXML

  def agetURL(command)
    $username = 'admin'
    $password = 'admin'
    # Open an HTTP connection to 
    ret = Net::HTTP.start('128.193.122.20')

    # Depending on the request type, create either
    # an HTTP::Get or HTTP::Post object

    req = Net::HTTP::Get.new(command)

    # Set up the authentication and
    # make the request
    req.basic_auth( $username, $password )
    res = ret.request(req)

    # Return the request body
    return res.body
  end
  
  def agetMeterXML(meterAddress)
    return getURL('/setup/devicexml.cgi?ADDRESS=' + meterAddress.to_s + '&TYPE=DATA')
  end
  
  def aaddDataPoint(data_set_id, value)
    newData = DataPoint.new
    newData.data_set_id = data_set_id
    newData.amount = value
	newData.save
  end
  
  def aparse_xml(modbus_address, meter_id)
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump
    DataSet.find(:all, :conditions => { :meter_id => meter_id }).each do |series|
      xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
        if ele.attribute("number").to_s.to_i == series.point_number
          addDataPoint(series.id, ele.attribute("value").to_s.to_i)
        end
      end
    end
  end
  
end
