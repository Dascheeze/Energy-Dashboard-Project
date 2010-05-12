class PowerInfoController < ApplicationController
  def index
    @buildings = Building.all
    add_crumb("Power Info")
    respond_to do |format|
      format.html
      format.xml { render :xml => @buildings }
    end
  end

  def showsets
    @building = Building.find(params[:id])
    meters = Meter.find(:all, :conditions => { :building_id => params[:id] })
    meters.each do |m|
      @list_sets = DataSet.find(:all, :conditions => { :meter_id => m.id})
    end
    add_crumb("Power Info", '/power_info')
    add_crumb(@building.building_name.to_s)
    respond_to do |format|
      format.html
      format.xml { render :xml => @list_sets}
    end
  end
end
