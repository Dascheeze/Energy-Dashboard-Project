# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  class	Item
    attr_reader :amount, :date
	attr_writer :date
	
	def amount=(a)
	  @amount = sprintf('%.2f', a).to_f
	end
	
  end
  
  class Bounds
    attr_reader :min_amount, :min_time, :max_amount, :max_time
	attr_writer :min_amount, :min_time, :max_amount, :max_time
  end
  
  def points_between_dates(data_set_id, start_date, end_date)
    #return_table = "<table>"
    #list_sets = DataSet.find(:all, :conditions => { :created_at => start_date..end_date, :id => data_set_id})
    #list_sets.each do |set|
    list_points = DataPoint.find(:all, :conditions => { :created_at => (start_date.gmtime)..(end_date.gmtime), :data_set_id => data_set_id })
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
    list_points.each do |point|
      if (i == 1)
        cur_time = point.created_at
        aggregate_amount = 0.to_f
      end
	    temp_amount = point.amount.to_s.to_f
      aggregate_amount = aggregate_amount + temp_amount
      if (i == num_to_aggregate)
		item = Item.new
        item.amount = aggregate_amount
        item.date = cur_time
        data_array.push(item)
        i = 1
      else
        i = i + 1
      end
    end
    return data_array
  end

  def data_to_array_diff(list_points, time_interval = 1.hour)
    duration_of_pull = 15.minutes
    data_array = Array.new
    i = 0
    time=0
    value=0
    num_to_aggregate = time_interval / duration_of_pull
    list_points.each do |point|
      if (i == 0)
        time = point.created_at
        value = point.amount.to_s.to_f
      end
      if (i == num_to_aggregate-1)
        item = Item.new
        item.amount = point.amount.to_s.to_f - value
        item.date = time
        data_array.push(item)
        i = 0
      else
        i = i + 1
      end
    end
    return data_array
  end
  

  def get_bounds(data_array)
	bounds = Bounds.new
    bounds.max_amount=0
    bounds.max_time=0
    bounds.min_amount=0
    bounds.min_time=0
    i=0
    
    data_array.each do |point|
      if(i==0)
        bounds.min_amount = point.amount
        bounds.min_time = point.date
      end
      
      if(bounds.max_amount < point.amount)
        bounds.max_amount = point.amount
        bounds.max_time = point.date
      end
	  
	  if(bounds.min_amount > point.amount)
        bounds.min_amount = point.amount
        bounds.min_time = point.date
      end
      i+=1
    end
    return bounds
  end
  
end

     
     
  


