require 'rails_helper'

feature 'Headhunter register valid job' do

	before :each do
		headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')
		nivel = Level.create!(name: 'Pleno')

		login_as headhunter, scope: :headhunter
		visit root_path
		click_on 'Cadastrar nova Vaga'
	end

	scenario 'successfully' do

		fill_in 'Titulo', with: 'Cientista de Dados'
		fill_in 'Empresa', with: 'PartYou'
		fill_in 'Descrição da Vaga', with: 'Desenvolvimento de soluções para saude'
		fill_in 'Habilidades', with: 'Machine Learning, IoT e Big data'
		fill_in 'Faixa Salárial', with: '5000'
		fill_in 'Data de Contratação', with: '04/05/2021'
		select 'Pleno', from: 'Nível'
		fill_in 'Região', with: 'AV. Washington Soares, 909, Fortaleza'
		fill_in 'Beneficios', with: 'Seguro de Vida, Plano Odontológico e Plano de Saúde'
		fill_in 'Funções do Cargo', with: 'Criação e estruturação da arquitetura de armazenamento de dados centralizado consumindo diferentes fontes de dados'
		fill_in 'Expectivas da Empresa', with: 'Profissional ativo e comunicativo'

		click_on 'Enviar Vaga'

		expect(page).to have_content('Vaga criada com sucesso')

		expect(page).to have_content('Cientista de Dados')
		expect(page).to have_content('PartYou')
		expect(page).to have_content('Desenvolvimento de soluções para saude')
		expect(page).to have_content('Machine Learning, IoT e Big data')
		expect(page).to have_content('R$ 5.000,00')
		expect(page).to have_content('04/05/2021')
		expect(page).to have_content('Pleno')
		expect(page).to have_content('AV. Washington Soares, 909, Fortaleza')
		expect(page).to have_content('Seguro de Vida, Plano Odontológico e Plano de Saúde')
		expect(page).to have_content('Criação e estruturação da arquitetura de armazenamento de dados centralizado consumindo diferentes fontes de dados')
		expect(page).to have_content('Profissional ativo e comunicativo')

	end

	scenario 'and title must be unique' do
		job = create(:job_opportunity, title: 'Desenvolvedor PHP')

		fill_in 'Titulo', with: 'Desenvolvedor PHP'

		click_on 'Enviar Vaga'

		expect(page).to have_content('Titulo já está em uso')
	end

	scenario 'and nothing can be blank' do

		fill_in 'Titulo', with: ''
		fill_in 'Empresa', with: ''
		fill_in 'Descrição da Vaga', with: ''
		fill_in 'Habilidades', with: ''
		fill_in 'Faixa Salárial', with: ''
		fill_in 'Data de Contratação', with: ''
		fill_in 'Região', with: ''
		fill_in 'Beneficios', with: ''
		fill_in 'Funções do Cargo', with: ''
		fill_in 'Expectivas da Empresa', with: ''

		click_on 'Enviar Vaga'

		expect(page).to have_content('Titulo não pode ficar em branco')
		expect(page).to have_content('Empresa não pode ficar em branco')
		expect(page).to have_content('Descrição da Vaga não pode ficar em branco')
		expect(page).to have_content('Habilidades não pode ficar em branco')
		expect(page).to have_content('Faixa Salárial não pode ficar em branco')
		expect(page).to have_content('Data de Contratação não pode ficar em branco')
		expect(page).to have_content('Região não pode ficar em branco')
		expect(page).to have_content('Beneficios não pode ficar em branco')
		expect(page).to have_content('Funções do Cargo não pode ficar em branco')
		expect(page).to have_content('Expectivas da Empresa não pode ficar em branco')

	end

	scenario 'and deadline can not in past' do

		fill_in 'Data de Contratação', with: '04/06/1995'
		click_on 'Enviar Vaga'
		expect(page).to have_content('Data de Contratação não pode estar no passado')
	end
	scenario 'and salary range must be a number' do

		fill_in 'Faixa Salárial', with: 'numero'
		click_on 'Enviar Vaga'
		expect(page).to have_content('Faixa Salárial não é um número')
	end
	scenario 'and salary_range must be greater than minimum wage' do

		fill_in 'Faixa Salárial', with: '1000'
		click_on 'Enviar Vaga'
		expect(page).to have_content('Faixa Salárial deve ser maior que 1045')
	end
end

