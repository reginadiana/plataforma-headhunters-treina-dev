require 'rails_helper'

feature 'Headhunter visit list of jobs' do
	
	context 'and search for same job' do
		before :each do
			headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
			login_as headhunter, scope: :headhunter

			job_opportunity = create(:job_opportunity, headhunter: headhunter, 
				title: "Desenvolvedor Frontend", skills: "React, Java Script e Linux")

			other_job_opportunity = create(:job_opportunity, 
				title: "Desenvolvedor Backend", skills: "React, Java Script e Github")

			visit job_opportunities_path
		end

		scenario 'successfully by title' do
			fill_in 'Busca', with: 'Frontend'
			click_on 'Pesquisar'

			expect(current_path).to eq search_job_opportunities_path 
			expect(current_path).to have_content("Desenvolvedor Frontend")
		end
	
		scenario 'successfully by skills' do
			fill_in 'Busca', with: 'Linux'
			click_on 'Pesquisar'

			expect(current_path).to eq search_job_opportunities_path 
			expect(current_path).to have_content("Desenvolvedor Frontend")
		end

		scenario 'but can not found because is blank' do

			fill_in 'Busca', with: ''
			click_on 'Pesquisar'
		
			expect(page).to have_link 'Voltar'
			expect(page).to have_content('Nenhum resultado encontrado para:')
		end

		scenario 'but can not found because name not exist' do

			fill_in 'Busca', with: 'PHP'
			click_on 'Pesquisar'
		
			expect(page).to have_link 'Voltar'
			expect(page).to have_content('Nenhum resultado encontrado para: PHP')
		end
		scenario 'by title but can not found because this job not is your' do

			visit search_job_opportunities_path("Backend") 
			expect(current_path).not_to have_content("Desenvolvedor Backend")
			expect(current_path).not_to have_content("Desenvolvedor Frontend")
		end
		scenario 'by skills but can not found because this job not is your' do

			visit search_job_opportunities_path("React") 
			expect(current_path).not_to have_content("Desenvolvedor Backend")
			expect(current_path).to have_content("Desenvolvedor Frontend")
		end
	end
end
