require 'rails_helper'

feature 'Candidate authentication' do
	context 'log in' do

		before :each do
			visit root_path
			click_on 'Sou candidato'
		end 

		scenario 'successfully' do

			candidate = User.create!(email: 'teste@teste.com.br', password: '12345678')
			
			expect(page).to have_content('Acessar conta como candidato')

			fill_in 'Email', with: candidate.email
			fill_in 'Senha', with: candidate.password

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Login efetuado com sucesso!')
			expect(page).to have_content( 'Recursos para Candidato' )
			expect(page).not_to have_link('Entrar')
			expect(page).to have_link('Sair')
			expect(current_path).to eq(job_opportunities_path)
		end

		scenario 'and must fill in all fields' do

			expect(page).to have_content('Acessar conta como candidato')

			fill_in 'Email', with: ''
			fill_in 'Senha', with: ''

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Email ou senha inválida.')
			expect(page).not_to have_link('Sair')
		end
  	end
	
	context 'cannot try acess headhunter' do
		scenario 'as a candidate' do
			candidate = User.create!(email: 'teste@teste.com.br', password: '12345678')
		
			visit root_path
			click_on 'Sou recrutador'

			expect(page).to have_content('Acessar conta como recrutador')

			fill_in 'Email', with: 'teste@teste.com.br'
			fill_in 'Senha', with: '12345678'

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Email ou senha inválida.')
			expect(page).not_to have_link('Sair')
		end
	end

	context 'sign up' do

		before :each do
			visit root_path
			click_on 'Sou candidato'
			click_on 'Criar conta como candidato'
		end

		scenario 'successfully' do

			fill_in 'Email', with: 'test@test.com.br'
			fill_in 'Senha', with: '12345678'
			fill_in 'Confirmação de senha', with: '12345678'
			within 'form' do
				click_on 'Criar conta como candidato'
			end

			expect(page).to have_content('Login efetuado com sucesso.')
			expect(page).to have_link('Sair')
			expect(page).not_to have_link('Entrar')
		end
		scenario 'other account already exist' do

			candidate = User.create!(email: 'teste@teste.com.br', password: '12345678')

			fill_in 'Email', with: 'teste@teste.com.br'
			fill_in 'Senha', with: '12345678'
			fill_in 'Confirmação de senha', with: '12345678'
			within 'form' do
				click_on 'Criar conta como candidato'
			end

			expect(page).to have_content('Email já está em uso')
			expect(page).not_to have_link('Sair')
		end

		scenario 'fields can not be blank' do

			fill_in 'Email', with: ''
			fill_in 'Senha', with: ''
			fill_in 'Confirmação de senha', with: ''

			within 'form' do
				click_on 'Criar conta como candidato'
			end

			expect(page).to have_content('Email não pode ficar em branco')
			expect(page).to have_content('Senha não pode ficar em branco')
		end

		scenario 'passwords are not the same' do

			fill_in 'Email', with: 'teste@teste.com.br'
			fill_in 'Senha', with: 'teste'
			fill_in 'Confirmação de senha', with: 'teste123'

			within 'form' do
				click_on 'Criar conta como candidato'
			end

			expect(page).to have_content('Confirmação de senha não é igual a Senha')
		end
	end

	context 'log out' do
		scenario 'successfully' do
			candidate = User.create!(email: 'teste@teste.com.br', password: '12345678')

			visit root_path
			click_on 'Sou candidato'
			
			expect(current_path).to eq(new_user_session_path)

			fill_in 'Email', with: candidate.email
			fill_in 'Senha', with: candidate.password

			within 'form' do
				click_on 'Entrar'
			end
		      		
			click_on 'Sair'

			expect(page).to have_content('Saiu com sucesso')
			expect(page).not_to have_link('Sair')
			expect(current_path).to eq(root_path)
		end
	end

	context 'forgot password' do
		before :each do
			visit root_path
			click_on 'Sou candidato'
			click_on 'Esqueceu sua senha?'
			expect(current_path).to eq(new_user_password_path)	
		end

		scenario 'and reset a new password successfully' do
			candidate = User.create!(email: 'teste@teste.com.br', password: '12345678')

			fill_in 'Email', with: candidate.email

			click_on 'Enviar instruções por email'

			expect(page).to have_content('Dentro de minutos, você receberá um e-mail com instruções para a troca da sua senha.')

			expect(current_path).to eq(new_user_session_path)
		end
		scenario 'but account not existent' do


			fill_in 'Email', with: 'emailaleatorio@gmail.com'

			click_on 'Enviar instruções por email'

			expect(page).to have_content('Email não encontrado')
			expect(current_path).to eq(user_password_path)
		end
	end
end
