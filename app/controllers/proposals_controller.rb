class ProposalsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_candidate, only: [:new, :create, :edit, :update] 

	def new
		@proposal = Proposal.new
		@jobs = JobOpportunity.where(headhunter: current_headhunter)
		@candidate = Candidate.find(params[:candidate_id])		
	end
	def create

		@proposal = Proposal.new

		if @proposal.save
			@proposal.hope!
			flash[:notice] = 'Proposta enviada com sucesso'	
		    	redirect_to job_opportunities_path
		end
	end

	private
	
	def require_params
		params.require(:proposal).permit(:message, :job_opportunity_id, :candidate_id)
	end

	def id
		params[:id]
	end

	# Bloqueia gerenciamento de propostas pelo candidato

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
