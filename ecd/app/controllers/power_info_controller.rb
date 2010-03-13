class PowerInfoController < ApplicationController
  def index
    @buildings = Building.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @buildings }
    end
  end

  def showsets
    meters = Meter.find(:all, :conditions => { :building_id => params[:id] })
    meters.each do |m|
      @list_sets = DataSet.find(:all, :conditions => { :meter_id => m.id})
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @list_sets}
    end
  end
end
