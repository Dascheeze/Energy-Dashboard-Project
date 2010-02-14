class BuildingTypesController < ApplicationController
  # GET /building_types
  # GET /building_types.xml
  def index
    @building_types = BuildingType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @building_types }
    end
  end

  # GET /building_types/1
  # GET /building_types/1.xml
  def show
    @building_type = BuildingType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @building_type }
    end
  end

  # GET /building_types/new
  # GET /building_types/new.xml
  def new
    @building_type = BuildingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building_type }
    end
  end

  # GET /building_types/1/edit
  def edit
    @building_type = BuildingType.find(params[:id])
  end

  # POST /building_types
  # POST /building_types.xml
  def create
    @building_type = BuildingType.new(params[:building_type])

    respond_to do |format|
      if @building_type.save
        flash[:notice] = 'BuildingType was successfully created.'
        format.html { redirect_to(@building_type) }
        format.xml  { render :xml => @building_type, :status => :created, :location => @building_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /building_types/1
  # PUT /building_types/1.xml
  def update
    @building_type = BuildingType.find(params[:id])

    respond_to do |format|
      if @building_type.update_attributes(params[:building_type])
        flash[:notice] = 'BuildingType was successfully updated.'
        format.html { redirect_to(@building_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /building_types/1
  # DELETE /building_types/1.xml
  def destroy
    @building_type = BuildingType.find(params[:id])
    @building_type.destroy

    respond_to do |format|
      format.html { redirect_to(building_types_url) }
      format.xml  { head :ok }
    end
  end
end
