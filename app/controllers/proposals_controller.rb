# frozen_string_literal: true

class ProposalsController < ApplicationController
  before_action :authenticate_visitor_candidate_without_profile
  before_action :authenticate_candidate, only: %i[new create]
  before_action :find_candidate

  def index
    @proposals = Proposal.where(candidate: @candidate)
  end

  def new
    @proposals = Proposal.find_by(candidate: @candidate)

    if @proposals
      flash[:alert] = 'Uma proposta para esta vaga já foi enviada'
      redirect_to candidate_path(@candidate)
    else
      @proposal = Proposal.new
      @jobs = JobOpportunity.where(headhunter: current_headhunter)
    end
  end

  def create
    @proposal = Proposal.new(require_params)
    @proposal.candidate = @candidate

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

  def authenticate_candidate
    redirect_to job_opportunities_path if user_signed_in?
  end

  def find_candidate
    @candidate = Candidate.find(params[:candidate_id])
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
