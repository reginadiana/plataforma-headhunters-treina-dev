class ApplyJobsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_head, only: [:new, :create, :edit, :update, :destroy] 

	def index
		@candidate = Candidate.find_by(user: current_user)
		@apply_jobs = ApplyJob.where(candidate: @candidate)
	end
	def show
		if user_signed_in?
	    		@candidate = Candidate.find_by(user: current_user)
			@comments = Comment.all
		end

		if headhunter_signed_in?
			@candidate = Candidate.find(id)
			@comments = Comment.where(headhunter: current_headhunter)
		end
	end
	def new
		@apply_job = ApplyJob.new		
	end
	def create

		@apply_job = ApplyJob.new(require_params)
		@apply_job.candidate = Candidate.find_by(user: current_user)
		@apply_job.job_opportunity = JobOpportunity.where(headhunter: current_headhunter)
		@apply_job.hope!

		if @apply_job.save
			flash[:notice] = 'Candidatura realizada com sucesso'	
		    	redirect_to job_opportunities_path
		else 
			render :new
		end
	end
	def edit
		@candidate = Candidate.find(id)
		@levels = Level.all
	end

	def update
		@candidate = Candidate.find(id)
		if @candidate.update(require_params)
			redirect_to @candidate
		else
			@levels = Level.all
			render :edit
		end
	end

	def destroy
		@candidate = Candidate.find(id)
		@candidate.destroy

		flash[:alert] = 'Perfil excluido. Para acessar a plataforma, crie outro perfil.'
		redirect_to new_candidate_path
	end

	private
	
	def require_params
		params.require(:apply_job).permit(:message, :candidate_id, :job_opportunity_id)
	end

	def id
		params[:id]
	end

	# Bloqueia gerenciamento de perfils pelo headhunter

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
