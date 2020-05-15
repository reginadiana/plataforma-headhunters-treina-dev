require 'rails_helper'

feature 'Headhunter view jobs' do

	scenario 'successfully' do    
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
		job_2 = create(:job_opportunity, title: 'Desenvolvedor Java')
	
		visit root_path

		expect(page).to have_content("Vagas Cadastradas")
		expect(page).to have_link("Cadastrar nova Vaga")
		expect(page).to have_link("Lista de Candidatos")

		expect(page).to have_content("Desenvolvedor PHP")
		expect(page).to have_link "details-#{job_1.id}"

		expect(page).not_to have_content("Desenvolvedor Java")
		expect(page).not_to have_link "details-#{job_2.id}"

	end

	scenario 'and view details' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)

		visit root_path
		find("a#details-#{job_1.id}").click()

		expect(page).to have_content("Desenvolvedor PHP")
		expect(page).to have_content("#{job_1.company}")
		expect(page).to have_content("#{job_1.region}")
		expect(page).to have_content("#{job_1.salary_range}")
		expect(page).to have_content("#{job_1.level.name}")
		expect(page).to have_content("#{job_1.description_job}")
		expect(page).to have_content("#{job_1.skills}")
		expect(page).to have_content I18n.l(job_1.deadline)
		expect(page).to have_content("#{job_1.benefits}")
		expect(page).to have_content("#{job_1.office_functions}")
		expect(page).to have_content("#{job_1.company_expectations}")

		expect(page).to have_link "edit-#{job_1.id}"
		expect(page).to have_link "delete-#{job_1.id}"
	end

	scenario 'and return to home page' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
	
		visit root_path
		find("a#details-#{job_1.id}").click()
		click_on "Voltar"

		expect(current_path).to eq job_opportunities_path
	end
end
