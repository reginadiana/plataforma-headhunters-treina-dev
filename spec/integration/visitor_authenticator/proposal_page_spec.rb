require 'rails_helper'

feature 'Visitor tries to acess proposals and must be authenticated to' do
  context 'visitor' do
    scenario 'cannot view index unless logged in' do
      visit candidate_proposals_path(rand(1..100)) 
    end
    scenario 'create a proposal' do
      visit new_candidate_proposal_path(rand(1..100))
    end
    scenario 'edit some proposal' do
      visit edit_candidate_proposal_path(rand(1..100), rand(1..100))
    end
    after :each do
      expect(current_path).to eq(root_path)
    end
  end
  context 'user' do
    before :each do
      user = User.create!(email: 'teste@teste.com.br', password: '12345678')
      login_as user, scope: :user
    end
    scenario 'cannot view index unless logged in' do
      visit candidate_proposals_path(rand(1..100)) 
    end
    scenario 'create a proposal' do
      visit new_candidate_proposal_path(rand(1..100))
    end
    scenario 'edit some proposal' do
      visit edit_candidate_proposal_path(rand(1..100), rand(1..100))
    end
    after :each do
      expect(current_path).to eq(new_candidate_path)
    end
  end
end
