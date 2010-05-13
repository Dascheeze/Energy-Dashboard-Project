class HelpController < ApplicationController
  def index
    @page_title = "Help"
    add_crumb("Help")
  end

end
