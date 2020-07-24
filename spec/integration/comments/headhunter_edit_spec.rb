# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter edit comment' do

   before :each do
      headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')
      login_as headhunter, scope: :headhunter

      comment = create(:comment, headhunter: headhunter, content: 'Ola, gostei do seu perfil')

      visit candidate_path(comment.candidate)

      click_on "edit-comment#{comment.id}"
   end

   scenario 'successfully' do

      fill_in 'Conteúdo do Comentário', with: 'Ola, Bianca Rosa'

      click_on 'Publicar'

      expect(page).to have_content('Comentário atualizada com sucesso')
   end

   scenario 'and can not be blank' do

      fill_in 'Conteúdo do Comentário', with: ''

      click_on 'Publicar'

      expect(page).to have_content('Conteúdo do Comentário não pode ficar em branco')
   end

end
