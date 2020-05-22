class CandidatesController < ApplicationController
	before_action :authenticate_visitor
	before_action :authenticate_head, except: [:index, :show, :search, :profile_as]
	before_action :authenticate_candidate, only: [:show, :edit, :update]

	def profile_as 
		@job_opportunity = JobOpportunity.find(params[:job_opportunity_id])
		@apply_job = ApplyJob.find(params[:apply_job_id])	

		if @apply_job.candidate.featured?
			@apply_job.candidate.not_highlighted!
		else
			@apply_job.candidate.featured!
			flash[:notice] = 'Perfil marcado como destaque'
		end

		redirect_to @job_opportunity 
	end

	def index
		if user_signed_in?
			redirect_to candidate_path(find_candidate)
		else
			@candidates = Candidate.all
		end
	end
	def show

		if user_signed_in?
	    		@candidate = find_candidate
			@comments = Comment.all
		end

		if headhunter_signed_in?
			@candidate = find_candidate_by_route
			@comments = Comment.where(headhunter: current_headhunter)
		end
	end

	def search
		@q = params[:q]
		@candidates = Candidate.search(@q).or(Candidate.search(@q))
	end

	def new
		@profile = find_candidate

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
		@candidate = find_candidate_by_route
		@levels = Level.all
	end

	def update
		@candidate = find_candidate_by_route
		if @candidate.update(require_params)
			redirect_to @candidate
		else
			@levels = Level.all
			render :edit
		end
	end

	def destroy
		@candidate = find_candidate
		@candidate.destroy

		flash[:alert] = 'Perfil excluido. Para acessar a plataforma, crie outro perfil.'
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

	def find_candidate_by_route
		Candidate.find(id)
	end
	
	def find_candidate
		Candidate.find_by(user: current_user)
	end

	# Bloqueia gerenciamento de perfils pelo headhunter

	def authenticate_head
	    if headhunter_signed_in?
		redirect_to job_opportunities_path
	    end
	end

	# Bloqueia acesso dos perfils aos outros candidatos
	def authenticate_candidate
		if user_signed_in?
			if not find_candidate_by_route.user === current_user
				redirect_to candidate_path(find_candidate)
			end
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
