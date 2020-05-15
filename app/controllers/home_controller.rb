class HomeController < ApplicationController
	def index
	    if user_signed_in? or headhunter_signed_in?
		redirect_to job_opportunities_path
	    end
	end
end
