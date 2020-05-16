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
end
