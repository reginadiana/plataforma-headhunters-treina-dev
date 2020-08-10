require 'rails_helper'

feature 'Candidate can not' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
    candidate = create(:candidate, user: user)
  end

  scenario 'to create some proposal by route' do
    visit new_candidate_proposal_path(rand(1..100))
    expect(current_path).to eq(job_opportunities_path)
  end

  scenario 'register valid proposal' do
    visit root_path
    click_on 'Meu Perfil'

    expect(page).not_to have_link 'Enviar proposta'
  end
end
