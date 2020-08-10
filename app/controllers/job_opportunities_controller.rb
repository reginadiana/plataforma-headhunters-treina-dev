class JobOpportunitiesController < ApplicationController
  before_action :authenticate_visitor_candidate_without_profile
  before_action :authenticate_candidate, only: %i[new create edit update destroy]
  before_action :authenticate_headhunter, only: %i[show edit update]

  def index
    @jobs = if headhunter_signed_in?
              JobOpportunity.where(headhunter: current_headhunter)
            else
              JobOpportunity.all
            end
  end

  def show
    @job = find_job
    @proposals = Proposal.where(job_opportunity: @job)
    @awnser_proposals = AwnserProposal.where(proposal: @proposals)
    @applyjob = ApplyJob.where(job_opportunity: @job)

    if user_signed_in?
      @candidate = Candidate.find_by(user: current_user)
      @apply_jobs = ApplyJob.where(candidate: @candidate, job_opportunity: @job)
    end
  end

  def search
    @q = params[:q]
    @jobs = JobOpportunity.search(@q).or(JobOpportunity.search(@q))
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
    @job = find_job
    @levels = Level.all
  end

  def update
    @job = find_job
    if @job.update(require_params)
      redirect_to @job
    else
      @levels = Level.all
      render :edit
    end
  end

  def destroy
    @job = find_job
    @job.destroy

    redirect_to job_opportunities_path
  end

  private

  def require_params
    params.require(:job_opportunity).permit(:title, :company, :description_job, :skills,
                                            :salary_range, :deadline, :level_id, :region,
                                            :benefits, :office_functions, :company_expectations, :headhunter_id)
  end

  def id
    params[:id]
  end

  def find_job
    JobOpportunity.find(id)
  end

  def authenticate_candidate
    redirect_to job_opportunities_path if user_signed_in?
  end

  def authenticate_headhunter
    if headhunter_signed_in?
      redirect_to job_opportunities_path unless find_job.headhunter === current_headhunter
    end
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
