require 'rails_helper'

feature 'Candidate register a awnser of proposal' do

	before :each do
		user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		@job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack")
		@candidate = create(:candidate, full_name: 'Fabio Akita', user: user)
		@proposal = create(:proposal, candidate: @candidate, job_opportunity: @job_opportunity)

		@accept = create(:choice, option: "Aceitar")
		reject = create(:choice, option: "Recusar")

	end

	context "register successfully and" do

		before :each do
			visit root_path
			click_on "Minhas Propostas"
			click_on "Enviar Feedback"
		end

		scenario 'accept him' do    

			fill_in 'Conteúdo da Resposta', with: 'Ola, podemos marcar!!'
			select 'Aceitar', from: 'Escolha'

			click_on "Enviar Feedback"

			expect(page).to have_content("Resposta enviada com sucesso")
			expect(page).to have_content("Aceito")
		end

		scenario 'reject him' do    

			fill_in 'Conteúdo da Resposta', with: 'Ola, infelizmente esta nao é a vaga que procuro no momento'
			select 'Recusar', from: 'Escolha'

			click_on "Enviar Feedback" 

			expect(page).to have_content("Resposta enviada com sucesso")
			expect(page).to have_content("Rejeitado")
		end
	end

	context "edit an awnser to" do

		before :each do
			awnser_proposal = create(:awnser_proposal, proposal: @proposal, choice: @accept)

			visit root_path
			click_on "Minhas Propostas"
			click_on "Enviar Feedback"
		end

		scenario 'reject' do
		
			select 'Recusar', from: 'Escolha'

			click_on "Enviar Feedback"

			expect(page).to have_content("Resposta atualizada com sucesso")
			expect(page).to have_content("Rejeitado")
		end
		scenario 'accept' do
		
			select 'Aceitar', from: 'Escolha'

			click_on "Enviar Feedback"

			expect(page).to have_content("Resposta atualizada com sucesso")
			expect(page).to have_content("Aceito")
		end
	end
end
