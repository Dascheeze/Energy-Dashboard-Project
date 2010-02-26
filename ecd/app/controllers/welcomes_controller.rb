class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.xml
  def index
    respond_to do |format|
      format.html
    end
  end
end
