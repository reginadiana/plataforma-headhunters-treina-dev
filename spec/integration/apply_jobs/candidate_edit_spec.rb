# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate edit message of apply for job' do

   before :each do
      user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
      login_as user, scope: :user

      @job_opportunity = create(:job_opportunity, title: 'Desenvolvedor FullStack')
      candidate = create(:candidate, user: user)

      apply_job = create(:apply_job, candidate: candidate, job_opportunity: @job_opportunity)

      visit root_path

      expect(current_path).to eq job_opportunities_path
      click_on 'Desenvolvedor FullStack'
      click_on 'Ver minha candidatura'
      click_on 'Editar Informações'
   end

   scenario 'successfully' do

      fill_in 'Mensagem para Candidatura', with: 'Eu, Bianca Rosa, brasileira, gostaria de me candidatar.'

      click_on 'Enviar Candidatura'

      expect(page).to have_content('Mensagem para Candidatura atualizada com sucesso')
   end

   scenario 'and can not be blank' do

      fill_in 'Mensagem para Candidatura', with: ''

      click_on 'Enviar Candidatura'

      expect(page).to have_content('Mensagem para Candidatura não pode ficar em branco')
   end

end
