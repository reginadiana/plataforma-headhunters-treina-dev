# frozen_string_literal: true

class InterviewsController < ApplicationController
  before_action :authenticate_visitor
  before_action :authenticate_candidate, only: %i[show new create]
  before_action :find_candidate_job, except: %i[show index]

  def index
    @candidate = Candidate.where(user: current_user)
    @interviews = Interview.where(candidate: @candidate)
  end

  def show
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
    @interviews = Interview.where(job_opportunity: @job_opportunity)
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(require_params)
    @interview.candidate = @candidate
    @interview.job_opportunity = @job_opportunity

    if @interview.save
      redirect_to interviews_path
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
      redirect_to interviews_path
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(id)
    @interview.destroy
    flash[:notice] = 'Entrevista desmarcada'
    redirect_to interviews_path
  end

  private

  def id
    params[:id]
  end

  def require_params
    params.require(:interview).permit(:interview_date, :hour, :address, :job_opportunity_id, :candidate_id)
  end

  def find_candidate_job
    @candidate = Candidate.find(params[:candidate_id])
    @job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
  end

  def authenticate_candidate
    redirect_to job_opportunities_path if user_signed_in?
  end

  def authenticate_visitor
    unless user_signed_in?
      redirect_to root_path unless headhunter_signed_in?
    end
    if user_signed_in?
      candidate = Candidate.find_by(user: current_user)
      redirect_to new_candidate_path unless candidate
    end
  end
end
