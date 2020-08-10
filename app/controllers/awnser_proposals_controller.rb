class AwnserProposalsController < ApplicationController
  before_action :authenticate_visitor_candidate_without_profile
  before_action :authenticate_headhunter, only: %i[new create edit update]
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
      @proposal.accepted! if @awnser_proposal.choice.option === 'Aceitar'
      @proposal.rejected! if @awnser_proposal.choice.option === 'Recusar'
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
      @proposal.accepted! if @awnser_proposal.choice.option === 'Aceitar'
      @proposal.rejected! if @awnser_proposal.choice.option === 'Recusar'
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

  def authenticate_headhunter
    redirect_to job_opportunities_path if headhunter_signed_in?
  end

  def find_candidate_and_proposal
    @candidate = Candidate.find(params[:candidate_id])
    @proposal = Proposal.find(params[:proposal_id])
  end

  def authenticate_visitor_candidate_without_profile
    unless user_signed_in?
      redirect_to root_path unless headhunter_signed_in?
    end
    if user_signed_in?
      candidate = Candidate.find_by(user: current_user)
      redirect_to new_candidate_path unless candidate
    end
  end
end
