class JobOpportunitiesController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_candidate, only: [:new, :create, :edit, :update, :destroy] 

	def index
		if headhunter_signed_in?
			@jobs = JobOpportunity.where(headhunter: current_headhunter)
		else 
			@jobs = JobOpportunity.all
		end
	end
	def show
	    	@job = JobOpportunity.find(id)
		@applyjob = ApplyJob.where(job_opportunity: @job)
	end
	def new
		@job = JobOpportunity.new
		@levels = Level.all		
	end
	def create
		@job = JobOpportunity.new(require_params)
		@job.headhunter = current_headhunter

            	if @job.save
			flash[:notice] = 'Vaga criada com sucesso'	
	    		redirect_to @job
	    	else 
			@levels = Level.all
			render :new
	    	end
	end
	def edit
		@job = JobOpportunity.find(id)
		@levels = Level.all
	end

	def update
		@job = JobOpportunity.find(id)
		if @job.update(require_params)
			redirect_to @job
		else
			@levels = Level.all
			render :edit
		end
	end

	def destroy
		@job = JobOpportunity.find(id)
		@job.destroy

		redirect_to job_opportunities_path
	end

	private
	
	def require_params
		params.require(:job_opportunity).permit(
			:title, 
			:company,
			:description_job,
			:skills,
			:salary_range,
			:deadline,
			:level_id,
			:region,
			:benefits,
			:office_functions,
			:company_expectations,
			:headhunter_id )
	end

	def id
		params[:id]
	end

	# Bloqueia gerenciamento de vagas pelo candidato
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
