class CommentsController < ApplicationController
  before_action :authenticate_visitor_candidate_without_profile
  before_action :find_candidate
  before_action :authenticate_user, except: %i[index show]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(require_params)
    @comment.candidate = Candidate.find(params[:candidate_id])
    @comment.headhunter = current_headhunter

    if @comment.save
      flash[:notice] = 'Comentário publicado com sucesso'
      redirect_to @candidate
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(id)
  end

  def update
    @comment = Comment.find(id)

    if @comment.update(require_params)
      redirect_to candidate_path(@candidate)
      flash[:notice] = 'Comentário atualizada com sucesso'
    else
      @candidate = Candidate.find(params[:candidate_id])
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(id)
    @comment.destroy
    flash[:alert] = 'Comentário excluido'
    redirect_to @candidate
  end

  private

  def id
    params[:id]
  end

  def require_params
    params.require(:comment).permit(:content, :headhunter_id, :candidate_id)
  end

  def find_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def authenticate_user
    redirect_to @candidate if user_signed_in?
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
