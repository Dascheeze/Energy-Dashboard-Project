class HubsController < ApplicationController
  # GET /hubs
  # GET /hubs.xml
  def index
    @hubs = Hub.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hubs }
    end
  end

  # GET /hubs/1
  # GET /hubs/1.xml
  def show
    @hub = Hub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hub }
    end
  end

  # GET /hubs/new
  # GET /hubs/new.xml
  def new
    @hub = Hub.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hub }
    end
  end

  # GET /hubs/1/edit
  def edit
    @hub = Hub.find(params[:id])
  end

  # POST /hubs
  # POST /hubs.xml
  def create
    @hub = Hub.new(params[:hub])

    respond_to do |format|
      if @hub.save
        flash[:notice] = 'Hub was successfully created.'
        format.html { redirect_to(@hub) }
        format.xml  { render :xml => @hub, :status => :created, :location => @hub }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hubs/1
  # PUT /hubs/1.xml
  def update
    @hub = Hub.find(params[:id])

    respond_to do |format|
      if @hub.update_attributes(params[:hub])
        flash[:notice] = 'Hub was successfully updated.'
        format.html { redirect_to(@hub) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hub.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hubs/1
  # DELETE /hubs/1.xml
  def destroy
    @hub = Hub.find(params[:id])
    @hub.destroy

    respond_to do |format|
      format.html { redirect_to(hubs_url) }
      format.xml  { head :ok }
    end
  end
end
