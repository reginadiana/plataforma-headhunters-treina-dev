# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate edits profile' do

   before :each do
      user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as user, scope: :user

      candidate = create(:candidate, user: user)

      visit candidate_path(candidate)
      click_on 'Editar Perfil'
   end

   scenario 'successfully' do

      fill_in 'Nome Completo', with: 'Giovana Avila'
      click_on 'Enviar Perfil'

      expect(page).to have_content('Giovana Avila')
   end

   scenario 'and cannot be black' do

      fill_in 'Nome Completo', with: ''
      click_on 'Enviar Perfil'

      expect(page).to have_content('Nome Completo não pode ficar em branco')
   end

   scenario 'and date of birth can not in future' do

      fill_in 'Data de Nascimento', with: '04/06/2030'
      click_on 'Enviar Perfil'
      expect(page).to have_content('Data de Nascimento não pode estar no futuro')
   end

   scenario 'and return to list jobs' do
      click_on 'Voltar'

      expect(current_path).to eq job_opportunities_path
   end
end
