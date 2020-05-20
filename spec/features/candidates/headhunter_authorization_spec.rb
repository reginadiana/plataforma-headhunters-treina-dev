require 'rails_helper'

feature 'Headhunter can not' do
	before :each do

		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter
		@candidate = create(:candidate, full_name: "Joice Silva")
	end
	
	scenario 'to create some candidate by route' do
		visit new_candidate_path
		expect(current_path).to eq(job_opportunities_path)
	end

	scenario 'to edit some candidate by route' do
		visit edit_candidate_path(@candidate)
		expect(current_path).to eq(job_opportunities_path)
	end

	scenario 'edit candidate' do

		visit root_path
		click_on "Lista de Candidatos"
		click_on "Joice Silva"

		expect(page).not_to have_link 'Editar Perfil'
	end
	scenario 'delete candidate' do

		visit root_path
		click_on "Lista de Candidatos"
		click_on "Joice Silva"

		expect(page).not_to have_link 'Excluir Perfil'
	end
end

