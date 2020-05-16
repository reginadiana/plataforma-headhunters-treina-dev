class CandidatesController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_head, only: [:new, :create, :edit, :update, :destroy] 

	def index
		@candidates = Candidate.all
	end
	def show
	    	@candidate = Candidate.where(user: current_user)
	end
	def new
		@profile = Candidate.find_by(user: current_user)

		if @profile
			redirect_to job_opportunities_path
		else
			@candidate = Candidate.new
			@levels = Level.all
		end		
	end
	def create

		@candidate = Candidate.new(require_params)
		@candidate.user = current_user

		if @candidate.save
			flash[:notice] = 'Perfil criado com sucesso'	
		    	redirect_to job_opportunities_path
		else 
			@levels = Level.all
			render :new
		end
	end
	def edit
		@candidate = Candidate.find(id)
		@levels = Level.all
	end

	def update
		@candidate = Candidate.find(id)
		if @candidate.update(require_params)
			redirect_to @candidate
		else
			@levels = Level.all
			render :edit
		end
	end

	def destroy
		@candidate = Candidate.find(id)
		@candidate.destroy

		redirect_to new_candidate_path
	end

	private
	
	def require_params
		params.require(:candidate).permit(
			:full_name, 
			:social_name,
			:date_of_birth,
			:profession,
			:profile_description,
			:experience,
			:formation,
			:level_id,
			:courses,
			:user_id,
			:avatar)
	end

	def id
		params[:id]
	end

	# Bloqueia gerenciamento de perfils pelo headhunter

	def authenticate_head
	    if headhunter_signed_in?
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
