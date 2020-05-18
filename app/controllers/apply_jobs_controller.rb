class ApplyJobsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_head, only: [:index, :new, :create, :edit, :update, :destroy] 

	def index
		@candidate = Candidate.find_by(user: current_user)
		@apply_jobs = ApplyJob.where(candidate: @candidate)
	end
	def new
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
		@apply_job = ApplyJob.new		
	end
	def create

		@apply_job = ApplyJob.new(require_params)
		@apply_job.candidate = Candidate.find_by(user: current_user)
		@apply_job.job_opportunity = JobOpportunity.find(params[:job_opportunity_id])

		if @apply_job.save
			@apply_job.hope!
			flash[:notice] = 'Candidatura realizada com sucesso'	
		    	redirect_to @apply_job.job_opportunity
		else 
			@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
			render :new
		end
	end

	private
	
	def require_params
		params.require(:apply_job).permit(:message, :candidate_id, :job_opportunity_id)
	end

	def id
		params[:id]
	end

	# Bloqueia acesso ao heahunter as vagas cadastradas pelo candidato

	def authenticate_head
	    if headhunter_signed_in?
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
