class HomeController < ApplicationController
	def index
		if headhunter_signed_in?
			redirect_to job_opportunities_path

		elsif user_signed_in?
			redirect_to new_candidate_path
		end
	end
end
