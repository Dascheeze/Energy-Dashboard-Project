# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  class	Item
    attr_reader :amount, :date
	attr_writer :amount, :date
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
    aggregate_amount = 0
    num_to_aggregate = time_interval / duration_of_pull
    puts "a"
    list_points.each do |point|
	  puts "f"
      if (i == 1)
        time = point.created_at
        aggregate_amount = 0.to_f
      end
      puts "b"
	  puts point
	  temp_amount = point.amount.to_s.to_f
	  puts temp_amount
	  puts aggregate_amount
      aggregate_amount = aggregate_amount + temp_amount
	  puts aggregate_amount
      puts "test"
      if (i == num_to_aggregate)
		puts "c"
		item = Item.new
        item.amount = aggregate_amount
        item.date = time
        data_array.push(item)
        i = 1
      else
		puts "d"
        i = i + 1
      end
    end
	puts "e"
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
      end
	  
	  if(bounds.min_amount > point.amount)
        bounds.min_amount = point.amount
        bounds.min_time = point.time
      end
      i+=1
    end
    return bounds
  end
end

     
     
  


