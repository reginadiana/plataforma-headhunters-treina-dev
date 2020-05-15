class JobOpportunitiesController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy] 

	def index
	    	@jobs = JobOpportunity.all
	end
	def show
	    	@job = JobOpportunity.find(id)
	end
	def create
		@job = JobOpportunity.new(require_params)
            	if @job.save
			flash[:notice] = 'Vaga criada com sucesso'	
	    		redirect_to @job
	    	else 
			render :new
	    	end
	end
	def new
		@job = JobOpportunity.new		
	end

	def edit
		@job = JobOpportunity.find(id)
	end

	def update
		@job = JobOpportunity.find(id)
		if @job.update(require_params)
			redirect_to @job
		else
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
			:level,
			:level_id,
			:region,
			:benefits,
			:office_functions,
			:company_expectations,
			:headhunter,
			:headhunter_id )
	end

	def id
		params[:id]
	end

	def authenticate_user
	    
	    if user_signed_in?
	      redirect_to job_opportunities_path
	    end
	end
end  
