require 'rails_helper'

feature 'Candidate sees the vacancies he applied for' do

	before :each do
		user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		@job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack")
		@candidate = create(:candidate, full_name: 'Fabio Akita', user: user)
	end

	scenario 'successfully' do    

		other_job_opportunity = create(:job_opportunity, title: "Desenvolvedor UX/UI")
		
		apply_job = create(:apply_job, job_opportunity: @job_opportunity, candidate: @candidate)
	
		visit root_path
		click_on 'Minhas Vagas'

		expect(page).to have_content("Desenvolvedor FullStack")
		expect(page).not_to have_link("Desenvolvedor UX/UI")
	end

	scenario "you haven't applied yet" do    

		other_job_opportunity = create(:job_opportunity, title: "Desenvolvedor UX/UI")
	
		visit root_path
		click_on 'Minhas Vagas'

		expect(page).to have_content("Nenhuma candidatura foi realizada")
		expect(page).not_to have_content("Desenvolvedor FullStack")
		expect(page).not_to have_content("Desenvolvedor UX/UI")
	end

	scenario 'and view detals of job' do
		
		apply_job = create(:apply_job, job_opportunity: @job_opportunity, candidate: @candidate)
	
		visit root_path
		click_on 'Minhas Vagas'
		click_on "Desenvolvedor FullStack"

		expect(current_path).to eq job_opportunity_path(@job_opportunity)
		expect(page).to have_content("Você se candidatou para esta vaga")
	end

	scenario 'and view detals your apply job' do
		
		apply_job = create(:apply_job, job_opportunity: @job_opportunity, candidate: @candidate)
	
		visit root_path
		click_on 'Minhas Vagas'
		click_on "Desenvolvedor FullStack"

		click_on "Ver minha candidatura"
		expect(page).to have_content("#{@job_opportunity.title}")
		expect(page).to have_content("#{@apply_job.message}")
		expect(page).to have_content("#{@apply_job.created_at}")

		expect(page).to have_link("Editar Informações")
		expect(page).to have_link("Retirar minha candidatura")
	end
	scenario 'not see other candidates' do

		other_candidate = create(:candidate)
		
		apply_job = create(:apply_job, job_opportunity: @job_opportunity, candidate: @candidate)
		other_apply_job = create(:apply_job, job_opportunity: @job_opportunity, candidate: other_candidate)
	
		visit root_path
		click_on 'Minhas Vagas'
		click_on "Desenvolvedor FullStack"

		expect(current_path).to eq job_opportunity_path(@job_opportunity)
		expect(page).not_to have_link("#{@candidate.full_name}")
		expect(page).not_to have_link("#{other_candidate.full_name}")
	end
end
