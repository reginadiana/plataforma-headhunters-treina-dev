# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate can not' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
    @candidate = create(:candidate, user: user)
  end

  scenario 'to create some comment by route' do
    visit new_candidate_comment_path(@candidate)
    expect(current_path).to eq(candidate_path(@candidate))
  end

  scenario 'register valid comment' do
    visit candidate_path(@candidate)

    expect(page).not_to have_link 'Deixar Comentário'
  end

  scenario 'delete comment' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')

    comment = create(:comment,
                     content: 'Ola, podemos marcar uma entrevista?',
                     headhunter: headhunter, candidate: @candidate)

    visit candidate_path(@candidate)

    expect(page).not_to have_link "delete-comment#{comment.id}"
  end
end
