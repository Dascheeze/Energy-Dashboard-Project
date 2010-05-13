class AdminController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate  
  
  def index
    @page_title = "Admin"
    add_crumb("Admin")
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
  
end
