require 'rails_helper'

feature 'Headhunter register a feedback' do

	before :each do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, headhunter: headhunter, title: "Desenvolvedor React")

		candidate = create(:candidate, full_name: "Lais Lima")
		@apply_job = create(:apply_job, candidate: candidate, job_opportunity: job_opportunity)

		@acepted = create(:choice, option: "Aceitar")

		visit job_opportunities_path
		click_on "Desenvolvedor React"

		expect(page).to have_content("Lais Lima")
		click_on "Enviar Feedback"		
		
		expect(current_path).to eq new_job_opportunity_apply_job_feedback_path(job_opportunity, @apply_job)
	end

	scenario 'successfully' do  

		fill_in 'Mensagem de Feedback', with: 'Ola, podemos marcar uma entrevista?'
		select 'Aceitar', from: 'Escolha'

		click_on "Enviar Feedback"

		expect(page).to have_content("Lais Lima")
		expect(page).to have_content("Aceito")
	end
end
