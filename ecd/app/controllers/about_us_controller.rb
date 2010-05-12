class AboutUsController < ApplicationController
  def index
    add_crumb("About Us")
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
