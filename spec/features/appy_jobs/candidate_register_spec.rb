require 'rails_helper'

feature 'Candidate apply for job' do

	scenario 'successfully' do    
		user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack")
	
		visit root_path
		click_on "Desenvolvedor FullStack"
		click_on "Quero me Candidatar"

		expect(page).to have_content('Você esta se candidatando para a vaga "#{job_opportunity.title}"')

		fill_in 'Mensagem para Candidatura', with: 'Eu, Bianca Rosa, brasileira, Operadora de CNC venho por meio desta me candidatar à vaga de Programador de CNC nesta empresa.'

		click_on "Enviar Candidatura"

		expect(current_path).to eq job_opportunity_path(job_opportunity)

		expect(page).to have_content("Você se candidatou para esta vaga")
		expect(page).not_to have_content("Quero me Candidatar")
	end

	scenario 'and can not be blank' do

		fill_in 'Mensagem para Candidatura', with: ''

		click_on "Enviar Candidatura"

		expect(page).to have_content('Mensagem para Candidatura não pode ficar em branco')
	end

end
