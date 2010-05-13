class AboutUsController < ApplicationController
  def index
    @page_title = "About Us"
    add_crumb("About Us")
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
