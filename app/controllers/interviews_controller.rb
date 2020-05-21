class InterviewsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_candidate, only: [:new, :create, :edit, :update, :destroy] 

	def new
		@interview = Interview.new
		@candidate = Candidate.find(params[:candidate_id])
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
	end

	def id
		params[:id]
	end

	def require_params
		params.require(:interview).permit(
			:interview_date, 
			:hour,
			:address,
			:job_opportunity_id,
			:candidate_id)
	end

	# Bloqueia gerenciamento de entrevistas pelo candidato
	def authenticate_candidate
	    if user_signed_in?
		redirect_to job_opportunities_path
	    end
	end

	def authenticate_visitor
		if not user_signed_in? 
			if not headhunter_signed_in?
				redirect_to root_path
			end
		end
	end
end
