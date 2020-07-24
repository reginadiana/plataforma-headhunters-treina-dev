# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate view your interviews' do

	context "successfully" do

		before :each do
			user = User.create!(email: 'lucas@gmail.com.br', password: '12345678')
			login_as user, scope: :user

			headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
			job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
			job_opportunity_b = create(:job_opportunity, title: 'Desenvolvedor Rails', headhunter: headhunter)
			job_opportunity_c = create(:job_opportunity, title: 'Desenvolvedor Java')

			candidate = create(:candidate, user: user)

			apply_job = create(:apply_job, job_opportunity: job_opportunity, candidate: candidate)
			apply_job_b = create(:apply_job, job_opportunity: job_opportunity_b, candidate: candidate)
			apply_job_c = create(:apply_job, job_opportunity: job_opportunity_c, candidate: candidate)

			interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate,
							interview_date: "21/05/2021", hour: "15:30",
							address: "Rua Vergueiro, 11")
			interview_b = create(:interview, job_opportunity: job_opportunity_b, candidate: candidate,
							interview_date: "21/05/2022", hour: "18:30",
							address: "Rua Map, 11")
		end

		scenario 'see a interview by details of job' do

			visit root_path

			click_on "Minhas Vagas"
			click_on "Desenvolvedor PHP"
			click_on "Ver minha candidatura"

			expect(page).to have_content("Vaga")
			expect(page).to have_content("Endereço")
			expect(page).to have_content("Data")
			expect(page).to have_content("Horário")
			expect(page).to have_content("Email do Recrutador")

			expect(page).to have_content("Entrevista Marcada")
			expect(page).to have_link("Desenvolvedor PHP")
			expect(page).to have_content("Rua Vergueiro, 11")
			expect(page).to have_content("21/05/2021")
			expect(page).to have_content("15:30")
			expect(page).to have_content("giovana@gmail.com.br")

			expect(page).not_to have_link("Desenvolvedor Rails")
			expect(page).not_to have_content("Rua Map, 11")
			expect(page).not_to have_content("21/05/2022")
			expect(page).not_to have_content("18:30")
		end

		scenario 'a list with all interviews' do
			visit root_path
			click_on "Minhas Entrevistas"

			expect(page).to have_content("Entrevistas Marcadas")

			expect(page).to have_link("Desenvolvedor PHP")
			expect(page).to have_content("Rua Vergueiro, 11")
			expect(page).to have_content("21/05/2021")
			expect(page).to have_content("15:30")
			expect(page).to have_content("giovana@gmail.com.br")

			expect(page).to have_link("Desenvolvedor Rails")
			expect(page).to have_content("Rua Map, 11")
			expect(page).to have_content("21/05/2022")
			expect(page).to have_content("18:30")
			expect(page).to have_content("giovana@gmail.com.br")
		end
		scenario 'have no interview for this job' do
			visit root_path

			click_on "Minhas Vagas"
			click_on "Desenvolvedor PHP"
			click_on "Ver minha candidatura"

			expect(page).not_to have_link("Entrevista Marcada")
			expect(page).not_to have_link("Desenvolvedor Java")
		end
	end
	scenario 'any interview register' do
		user = User.create!(email: 'lucas@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		candidate = create(:candidate, user: user)

		visit root_path
		click_on "Minhas Entrevistas"
		expect(page).to have_content("Nenhuma entrevista marcada")
	end
end
