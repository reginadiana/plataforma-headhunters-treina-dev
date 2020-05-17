class CommentsController < ApplicationController 
	before_action :find_candidate

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
end  
