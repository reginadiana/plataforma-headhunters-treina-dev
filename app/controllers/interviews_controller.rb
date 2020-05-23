class InterviewsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_candidate, only: [:show, :new, :create, :edit, :update, :destroy] 
	before_action :find_candidate_job, except: [:show, :index] 

	def index	
		@candidate = Candidate.where(user: current_user)
		@interviews = Interview.where(candidate: @candidate)
	end
	def show
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
		@interviews = Interview.where(job_opportunity: @job_opportunity)
	end

	def new
		@interview = Interview.find_by(job_opportunity: @job_opportunity, candidate: @candidate)

		if @interview
			render :edit	
		else
			@interview = Interview.new
		end
	end

	def create
		@interview = Interview.new(require_params)
		@interview.candidate = @candidate
		@interview.job_opportunity = @job_opportunity

		if @interview.save
			redirect_to job_opportunity_path(@job_opportunity)
			flash[:notice] = 'Entrevista marcada com sucesso'
		else
			render :new
		end
	end

	def edit
		@interview = Interview.find(id)
	end

	def update
		@interview = Interview.find(id)
		if @interview.update(require_params)
			flash[:notice] = 'Entrevista atualizada com sucesso'	
			redirect_to job_opportunity_path(@job_opportunity)
		else
			render :edit
		end
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

	def find_candidate_job
		@candidate = Candidate.find(params[:candidate_id])
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
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
