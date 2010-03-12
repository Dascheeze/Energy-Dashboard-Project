# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    require 'net/http'


  def getURL(command)
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
  
  def getMeterXML(meterAddress)
    return getURL('/setup/devicexml.cgi?ADDRESS=' + meterAddress.to_s + '&TYPE=DATA')
  end
  
  def addDataPoint(series, value)
    newData = Data.new
    newData.series_id = series
    newData.amount = value
	newData.save
  end
  
  def parse_xml(modbus_address, meter_id)
    require 'rexml/document'
    include REXML
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump

    Series.each do |series|
      if series.meter_id == meter_id
        xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
          if ele.attribute["number"] == series.point_number
            addDataPoint(series.id, ele.attribute["value"])
          end
          puts ele.attribute["number"]
        end
      end
    end
  end

  def points_between_dates(data_set_id, start_date, end_date)
    #return_table = "<table>"
    #list_sets = DataSet.find(:all, :conditions => { :created_at => start_date..end_date, :id => data_set_id})
    #list_sets.each do |set|
    list_points = DataPoint.find(:all, :conditions => { :created_at => (start_date+8.hours)..(end_date+8.hours), :data_set_id => data_set_id })
    #return_table = return_table + "<tr>"
    #list_points.each do |data_points|
    #  return_table = return_table + "<td>" + data_points.amount.to_s + "</td>"
    #end
    #return_table = return_table + "</tr>"
    #end
    #return_table = return_table + "</table>"
    return list_points
  end
  
  def data_to_array(list_points, time_interval = 1.hour)
    duration_of_pull = 15.minutes
    data_array = Array.new
    i = 1
    
    num_to_aggregate = time_interval / duration_of_pull
    
    list_points.each do |point|
      if (i == 1)
        time = point.created_at
        aggregate_amount = 0
      end
      
      aggregate_amount += point.amount
      
      if (i == num_to_aggregate)
        item.amount = aggregate_amount
        item.date = time
        data_array.push(item)
        i = 1
      else
        i += 1
      end
    end
    return data_array
  end
  
  def getBounds(data_array)
    bounds.max_amount=0
    bounds.max_time=0
    bounds.min_amount=0
    bounds.min_time=0
    i=0
    
    list_points.each do |point|
      if(i==0)
        bounds.min_amount = point.amount
        bounds.min_time = point.created_at
      end
      
      if(bounds.max_amount < point.amount)
        bounds.max_amount = point.amount
        bounds.max_time = point.created_at
      elsif(bounds.min_amount > point.amount)
        bounds.min_amount = point.amount
        bounds.min_time = point.time
      end
      i+=1
    end
    return bounds
  end
end

     
     
  


