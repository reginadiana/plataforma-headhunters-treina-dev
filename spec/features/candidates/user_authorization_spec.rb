require 'rails_helper'

feature 'User authorization' do
	context 'and try to acess job' do
		scenario "but don't have a profile" do

			user = User.create!(email: 'teste@teste.com.br', password: '12345678')
			visit root_path
			click_on 'Sou candidato'
			
			expect(page).to have_content('Acessar conta como candidato')

			fill_in 'Email', with: user.email
			fill_in 'Senha', with: user.password

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Login efetuado com sucesso!')
			expect(page).to have_link('Sair')

			expect(page).not_to have_content('Recursos para Candidato')
			expect(current_path).to eq(new_candidate_path)
		end
	end
	context 'and create a profile' do

		before :each do
			user = User.create!(email: 'teste@teste.com.br', password: '12345678')
			nivel = Level.create!(name: 'Pleno')
		
			visit root_path
			click_on 'Sou candidato'
			
			expect(page).to have_content('Acessar conta como candidato')

			fill_in 'Email', with: user.email
			fill_in 'Senha', with: user.password

			within 'form' do
				click_on 'Entrar'
			end
	
			expect(current_path).to eq(new_candidate_path)
		end
		scenario "successfully" do

			fill_in 'Nome Completo', with: 'Larissa Fernandes'
			fill_in 'Nome Social', with: 'Larissa'
			fill_in 'Data de Aniversário', with: '03/04/1998'
			fill_in 'Descrição do Perfil', with: 'Enquanto fiz parte da equipe da empresa ABC, contribui para a melhoria dos processos administrativos sob a supervisão do Controller.'
			fill_in 'Experiência', with: 'Atuo a 10 anos com desenvolvimento de sistemas para a Microsoft'
			fill_in 'Formação', with: 'Ensino Médio concluído desde 2016, com curso técnico de Gestão Administrativa.'
			fill_in 'Cursos', with: 'Curso técnico de auxiliar de cozinha pelo SENAC desde 2014'

			select 'Pleno', from: 'Nível'
			click_on 'Enviar Perfil'

			expect(page).to have_link('Sair')
			expect(page).to have_content('Perfil criado com sucesso')
			expect(page).to have_content('Recursos para Candidato')
			expect(current_path).to eq(job_opportunities_path)
		end
		scenario "and can not be blank" do

			fill_in 'Nome Completo', with: ''
			fill_in 'Nome Social', with: ''
			fill_in 'Data de Aniversário', with: ''
			fill_in 'Descrição do Perfil', with: ''
			fill_in 'Experiência', with: ''
			fill_in 'Formação', with: ''
			fill_in 'Cursos', with: ''

			click_on 'Enviar Perfil'

			expect(page).to have_content('Nome Completo não pode ficar em branco')
			expect(page).to have_content('Nome Social não pode ficar em branco')
			expect(page).to have_content('Data de Aniversário não pode ficar em branco')
			expect(page).to have_content('Descrição do Perfil não pode ficar em branco')
			expect(page).to have_content('Formação não pode ficar em branco')

			expect(page).not_to have_content('Cursos não pode ficar em branco')
			expect(page).not_to have_content('Experiência não pode ficar em branco')

		end
		scenario 'and date of birth can not in future' do

			fill_in 'Data de Aniversário', with: '04/06/2025'
			click_on 'Enviar Perfil'
			expect(page).to have_content('Data de Aniversário não pode estar no futuro')
		end
	end
end
