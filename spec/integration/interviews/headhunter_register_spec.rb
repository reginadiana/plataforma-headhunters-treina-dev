# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter register a interview' do

   context 'for vacancy candidates ' do

      before :each do
         headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
         login_as headhunter, scope: :headhunter

         job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
         candidate = create(:candidate, full_name: 'Camila de Melo')
         apply_job = create(:apply_job, candidate: candidate, job_opportunity: job_opportunity)

         visit job_opportunity_path(job_opportunity)
         click_on 'Agendar Entrevista'
      end

      scenario 'successfully' do

         fill_in 'Data', with: '12/11/2021'
         fill_in 'Hora', with: '18:20'
         fill_in 'Endereço', with: ' Condominio Edifício Morungaba - Alameda Santos, 1293 - Cerqueira César, São Paulo - SP, 01419-001'

         click_on 'Convidar'

         expect(page).to have_content('Entrevista marcada com sucesso')
      end

      scenario 'can not be blank' do

         fill_in 'Data', with: ''
         fill_in 'Hora', with: ''
         fill_in 'Endereço', with: ''

         click_on 'Convidar'

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

   context 'for candidates who approved the proposal' do

      before :each do
         headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
         login_as headhunter, scope: :headhunter

         @job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
         @candidate = create(:candidate, full_name: 'Camila de Melo')

      end

      scenario 'successfully' do

         proposal = create(:proposal,
           candidate: @candidate,
           job_opportunity: @job_opportunity)

         proposal.accepted!

         accepted = create(:choice, option: 'Aceitar')
         awnser_proposal = create(:awnser_proposal, proposal: proposal, choice: accepted)

         visit root_path
         click_on 'Minhas Vagas'
         click_on 'Desenvolvedor PHP'

         expect(page).to have_content('Camila de Melo')
         expect(page).to have_content('Aceito')

         click_on 'Agendar Entrevista'

         fill_in 'Data', with: '12/11/2021'
         fill_in 'Hora', with: '18:20'
         fill_in 'Endereço', with: ' Condominio Edifício Morungaba - Alameda Santos, 1293 - Cerqueira César, São Paulo - SP, 01419-001'

         click_on 'Convidar'

         expect(page).to have_content('Entrevista marcada com sucesso')
      end

      scenario 'can not interview candidates who not accept proposal' do

         proposal = create(:proposal,
           candidate: @candidate,
           job_opportunity: @job_opportunity)

         proposal.rejected!

         reject = create(:choice, option: 'Recusar')
         awnser_proposal = create(:awnser_proposal, proposal: proposal, choice: reject)

         visit job_opportunity_path(@job_opportunity)

         expect(page).not_to have_link('Agendar Entrevista')
      end

      scenario 'can not interview candidates who still not accept proposal' do

         proposal = create(:proposal,
           candidate: @candidate,
           job_opportunity: @job_opportunity)

         proposal.hope!

         visit job_opportunity_path(@job_opportunity)
         expect(page).not_to have_link('Agendar Entrevista')
      end

   end
end
