require 'rails_helper'

feature 'Headhunter edit an interview' do

	context "for vacancy candidates " do

		before :each do
			headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
			login_as headhunter, scope: :headhunter

			job_opportunity = create(:job_opportunity, title: "Desenvolvedor PHP", headhunter: headhunter)
			candidate = create(:candidate, full_name: "Camila de Melo")
			interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate)

			visit job_opportunity_path(job_opportunity)
			click_on "Minhas Entrevistas"	
			click_on "Editar"	
		end

		scenario 'successfully' do

			fill_in 'Data', with: '13/11/2021'
			fill_in 'Hora', with: '17:20'

			click_on "Convidar"

			expect(page).to have_content("Entrevista atualizada com sucesso")
		end

		scenario 'can not be blank' do

			fill_in 'Data', with: ''
			fill_in 'Hora', with: ''
			fill_in 'Endereço', with: ''

			click_on "Convidar"

			expect(page).to have_content('Data não pode ficar em branco')
			expect(page).to have_content('Hora não pode ficar em branco')
			expect(page).to have_content('Endereço não pode ficar em branco')
		end

		scenario 'and date can not in past' do

			fill_in 'Data', with: '04/06/2019'
			click_on 'Convidar'
			expect(page).to have_content('Data não pode estar no passado')
		end
	end

	context "for candidates who approved the proposal" do

		scenario 'successfully' do
			headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
			login_as headhunter, scope: :headhunter

			job_opportunity = create(:job_opportunity, title: "Desenvolvedor PHP", headhunter: headhunter)
			candidate = create(:candidate, full_name: "Camila de Melo")

			interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate)

			visit job_opportunity_path(job_opportunity)
			click_on "Minhas Entrevistas"	

			expect(page).to have_content('Camila de Melo')

			click_on "Editar"

			fill_in 'Endereço', with: 'Masp'
			click_on "Convidar"

			expect(page).to have_content("Entrevista atualizada com sucesso")
		end
	end
end
