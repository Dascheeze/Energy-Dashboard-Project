class HomeController < ApplicationController
	def index
   @page_title = "Home" 
		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
