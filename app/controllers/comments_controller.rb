class CommentsController < ApplicationController 
	before_action :find_candidate
	before_action :authenticate_user, except: [:index, :show] 

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

	# Bloqueia gerenciamento de comentarios pelo candidato

	def authenticate_user
	    if user_signed_in?
		redirect_to @candidate
	    end
	end
end  
