class FeedbacksController < ApplicationController
	before_action :authenticate_visitor
	before_action :find_apply_and_job

	def new
		@feedback = Feedback.new
		@choices = Choice.all		
	end
	def create
		@feedback = Feedback.new(require_params)
		@feedback.apply_job = @apply_job

		if @feedback.save
	
			if @feedback.choice.option === "Aceitar"
				@apply_job.accepted!
			end

			if @feedback.choice.option === "Recusar"
				@apply_job.rejected!
			end
			
			flash[:notice] = 'Feedback enviado com sucesso'	
		    	redirect_to job_opportunity_path(@job_opportunuty)
		end 
	end

	def edit
		@feedback = Feedback.find(id)
		@choices = Choice.all
	end

	def update
		@feedback = Feedback.find(id)
		if @feedback.update(require_params)

			if @feedback.choice.option === "Aceitar"
				@apply_job.accepted!
			end

			if @feedback.choice.option === "Recusar"
				@apply_job.rejected!
			end

			flash[:notice] = 'Feedback atualizada com sucesso'	
			redirect_to job_opportunity_path(@job_opportunuty)
		end
	end

	private
	
	def require_params
		params.require(:feedback).permit(:message, :apply_job_id, :choice_id)
	end

	def id
		params[:id]
	end

	def find_apply_and_job
		@job_opportunuty = JobOpportunity.find(params[:job_opportunity_id])
		@apply_job = ApplyJob.find(params[:apply_job_id])
	end

	def authenticate_visitor
		if not user_signed_in? 
			if not headhunter_signed_in?
				redirect_to root_path
			end
		end
	end
end  
