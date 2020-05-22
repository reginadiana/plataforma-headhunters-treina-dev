require 'rails_helper'

feature 'Headhunter view your interviews' do

	scenario 'successfully' do    
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
		candidate = create(:candidate, full_name: "Lucas Ribeiro", profession: "Desenvolvedor Backend")
		apply_job = create(:apply_job, job_opportunity: job_opportunity, candidate: candidate)
		interview = create(:interview, job_opportunity: job_opportunity, 
						interview_date: "21/05/2021", hour: "15:30",
						address: "Rua Vergueiro, 11", candidate: candidate)

		visit job_opportunity_path(job_opportunity)

		click_on "Minhas Entrevistas"

		expect(page).to have_content("Vaga")
		expect(page).to have_content("Endereço")
		expect(page).to have_content("Data")
		expect(page).to have_content("Horário")
		expect(page).to have_content("Candidato")

		expect(page).to have_content("Entrevistas para esta vaga")
		expect(page).to have_link("Desenvolvedor PHP")
		expect(page).to have_content("Rua Vergueiro, 11")
		expect(page).to have_content("21/05/2021")
		expect(page).to have_content("15:30")
		expect(page).to have_link("Lucas Ribeiro")
		expect(page).to have_content("Desenvolvedor Backend")
	end

	scenario 'any interview register' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)

		visit job_opportunity_path(job_opportunity)
		click_on "Minhas Entrevistas" 
		expect(page).to have_content("Nenhuma entrevista marcada")
	end
end
