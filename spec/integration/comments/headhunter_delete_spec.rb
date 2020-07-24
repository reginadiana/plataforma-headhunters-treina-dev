# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter deletes comment' do

   scenario 'successfully' do

      headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as headhunter, scope: :headhunter

      candidate = create(:candidate, full_name: 'Thiago Ventura')
      comment = create(:comment,
          content: 'Ola, podemos marcar uma entrevista?',
          headhunter: headhunter, candidate: candidate)

      visit candidate_path(candidate)

      click_on "delete-comment#{comment.id}"

      expect(page).to have_content('Comentário excluido')
      expect(page).not_to have_content("#{comment.content}")
   end

   scenario 'and keep anothers' do

      headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as headhunter, scope: :headhunter

      candidate = create(:candidate, full_name: 'Thiago Ventura')
      comment_a = create(:comment,
          content: 'Ola, podemos marcar uma entrevista?',
          headhunter: headhunter, candidate: candidate)

      comment_b = create(:comment,
          content: 'Ola, posso mandar um teste tecnico?',
          headhunter: headhunter, candidate: candidate)

      visit candidate_path(candidate)

      click_on "delete-comment#{comment_a.id}"

      expect(current_path).to eq candidate_path(candidate)

      expect(page).to have_content('Comentário excluido')
      expect(page).to have_content("#{comment_b.content}")
      expect(page).not_to have_content("#{comment_a.content}")
   end
end
