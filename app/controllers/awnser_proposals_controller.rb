class AwnserProposalsController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_headhunter, only: [:new, :create, :edit, :update] 
	before_action :find_candidate_and_proposal

	def new
		@awnser_proposal = AwnserProposal.find_by(proposal: @proposal)

		if @awnser_proposal
			@choices = Choice.all
			render :edit	
		else
			@awnser_proposal = AwnserProposal.new
			@choices = Choice.all
		end		
	end
	def create
		@awnser_proposal = AwnserProposal.new(require_params)
		@awnser_proposal.proposal = @proposal

		if @awnser_proposal.save
			
			if @awnser_proposal.choice.option === "Aceitar"
				@proposal.accepted!
			end

			if @awnser_proposal.choice.option === "Recusar"
				@proposal.rejected!
			end

			flash[:notice] = 'Resposta enviada com sucesso'	
		    	redirect_to candidate_proposals_path(@candidate)
		end	
	end

	def edit
		@awnser_proposal = AwnserProposal.find(id)
		@choices = Choice.all
	end

	def update
		@awnser_proposal = AwnserProposal.find(id)
		if @awnser_proposal.update(require_params)
			flash[:notice] = 'Resposta atualizada com sucesso'	
			redirect_to candidate_proposals_path(@candidate)
		end
	end

	private
	
	def require_params
		params.require(:awnser_proposal).permit(:message, :choice_id, :proposal_id)
	end

	def id
		params[:id]
	end

	# Bloqueia gerenciamento de respostas pelo headhunter

	def authenticate_headhunter
	    if headhunter_signed_in?
		redirect_to job_opportunities_path
	    end
	end

	def find_candidate_and_proposal
		@candidate = Candidate.find(params[:candidate_id])
		@proposal = Proposal.find(params[:proposal_id])
	end

	def authenticate_visitor
		if not user_signed_in? 
			if not headhunter_signed_in?
				redirect_to root_path
			end
		end
	end
end  
