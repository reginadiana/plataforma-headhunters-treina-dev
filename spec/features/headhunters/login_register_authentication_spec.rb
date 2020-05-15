require 'rails_helper'

feature 'Headhunter authentication' do
	context 'log in' do

		before :each do
			visit root_path
			click_on 'Sou recrutador'
		end 

		scenario 'successfully' do

			headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')
			
			expect(page).to have_content('Acessar conta como recrutador')

			fill_in 'Email', with: headhunter.email
			fill_in 'Senha', with: headhunter.password

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Login efetuado com sucesso!')
			expect(page).not_to have_link('Entrar')
			expect(page).to have_link('Sair')
			expect(current_path).to eq(root_path)
		end

		scenario 'and must fill in all fields' do

			expect(page).to have_content('Acessar conta como recrutador')

			fill_in 'Email', with: ''
			fill_in 'Senha', with: ''

			within 'form' do
				click_on 'Entrar'
			end

			expect(page).to have_content('Email ou senha inválida.')
			expect(page).not_to have_link('Sair')
		end
  	end

	context 'log out' do
		scenario 'successfully' do
			headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')

			visit root_path
			click_on 'Sou recrutador'
			
			expect(page).to have_content('Acessar conta como recrutador')

			fill_in 'Email', with: headhunter.email
			fill_in 'Senha', with: headhunter.password

			within 'form' do
				click_on 'Entrar'
			end
		      		
			click_on 'Sair'

			expect(page).to have_content('Saiu com sucesso')
			expect(page).not_to have_link('Sair')
			expect(current_path).to eq(root_path)
		end
	end

	context 'sign up' do

		before :each do
			visit root_path
			click_on 'Sou recrutador'
			click_on 'Criar conta como recrutador'
		end

		scenario 'successfully' do

			fill_in 'Email', with: 'test@test.com.br'
			fill_in 'Senha', with: '12345678'
			fill_in 'Confirmação de senha', with: '12345678'
			within 'form' do
				click_on 'Criar conta como recrutador'
			end

			expect(page).to have_content('Login efetuado com sucesso.')
			expect(page).to have_link('Sair')
			expect(page).not_to have_link('Entrar')
		end
		scenario 'other account already exist' do

			headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')

			fill_in 'Email', with: 'teste@teste.com.br'
			fill_in 'Senha', with: '12345678'
			fill_in 'Confirmação de senha', with: '12345678'
			within 'form' do
				click_on 'Criar conta como recrutador'
			end

			expect(page).to have_content('Email já está em uso')
			expect(page).not_to have_link('Sair')
		end

		scenario 'fields can not be blank' do

			fill_in 'Email', with: ''
			fill_in 'Senha', with: ''
			fill_in 'Confirmação de senha', with: ''

			within 'form' do
				click_on 'Criar conta como recrutador'
			end

			expect(page).to have_content('Email não pode ficar em branco')
			expect(page).to have_content('Senha não pode ficar em branco')
		end

		scenario 'passwords are not the same' do

			fill_in 'Email', with: 'teste@teste.com.br'
			fill_in 'Senha', with: 'teste'
			fill_in 'Confirmação de senha', with: 'teste123'

			within 'form' do
				click_on 'Criar conta como recrutador'
			end

			expect(page).to have_content('Confirmação de senha não é igual a Senha')
		end
	end
end
