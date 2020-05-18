class ApplyJobsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_head, only: [:index, :new, :create, :edit, :update, :destroy] 
	before_action :find_job_opportunity, only: [:show, :new, :edit, :update, :destroy]

	def index
		@candidate = Candidate.find_by(user: current_user)
		@apply_jobs = ApplyJob.where(candidate: @candidate)
	end
	def show
		@apply_job = ApplyJob.find(id)
	end
	def new
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

	def edit
		@apply_job = ApplyJob.find(id)
	end

	def update
		@apply_job = ApplyJob.find(id)
	
		if @apply_job.update(require_params)
			redirect_to job_opportunity_apply_job_path(@job_opportunity)
			flash[:notice] = 'Mensagem para Candidatura atualizada com sucesso'
		else
			@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
			render :edit
		end
	end

	def destroy
		@apply_job = ApplyJob.find(id)
		@apply_job.destroy

		flash[:alert] = 'Candidatura encerrada'
		redirect_to job_opportunity_path(@job_opportunity)
	end

	private
	
	def require_params
		params.require(:apply_job).permit(:message, :candidate_id, :job_opportunity_id)
	end

	def id
		params[:id]
	end

	# Busca a vaga selecionada

	def find_job_opportunity
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
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
