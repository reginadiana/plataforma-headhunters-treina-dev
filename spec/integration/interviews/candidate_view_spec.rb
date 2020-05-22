require 'rails_helper'

feature 'Candidate view your interviews' do

	scenario 'successfully' do    
		user = User.create!(email: 'lucas@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
		candidate = create(:candidate, user: user)
		apply_job = create(:apply_job, job_opportunity: job_opportunity, candidate: candidate)
		interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate,
						interview_date: "21/05/2021", hour: "15:30",
						address: "Rua Vergueiro, 11")

		visit root_path

		click_on "Minhas Vagas"
		click_on "Desenvolvedor PHP"
		click_on "Ver minha candidatura"

		expect(page).to have_content("Vaga")
		expect(page).to have_content("Endereço")
		expect(page).to have_content("Data")
		expect(page).to have_content("Horário")
		expect(page).to have_content("Email do Recrutador")

		expect(page).to have_content("Entrevistas Marcadas")
		expect(page).to have_link("Desenvolvedor PHP")
		expect(page).to have_content("Rua Vergueiro, 11")
		expect(page).to have_content("21/05/2021")
		expect(page).to have_content("15:30")
		expect(page).to have_content("giovana@gmail.com.br")
	end
end
