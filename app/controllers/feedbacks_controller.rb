# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_visitor_candidate_without_profile
  before_action :find_apply_and_job

  def new
    @feedback = Feedback.find_by(apply_job: @apply_job)
    @choices = Choice.all

    if @feedback
      render :edit
    else
      @feedback = Feedback.new
    end
  end

  def create
    @feedback = Feedback.new(require_params)
    @feedback.apply_job = @apply_job

    if @feedback.save
      @apply_job.accepted! if @feedback.choice.option === 'Aceitar'

      @apply_job.rejected! if @feedback.choice.option === 'Recusar'
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
      @apply_job.accepted! if @feedback.choice.option === 'Aceitar'

      @apply_job.rejected! if @feedback.choice.option === 'Recusar'
      flash[:notice] = 'Feedback atualizado com sucesso'
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
