require 'rails_helper'

feature 'Visitor and user tries to acess profile candidates and' do
  context 'visitor' do
    scenario 'cannot view index unless logged in' do
      visit candidates_path
    end
    scenario 'and must be authenticated to see detals' do
      candidate = create(:candidate)
      visit candidate_path(candidate)
    end
    scenario 'and must be authenticated to create a new candidate' do
      visit new_candidate_path
    end
    scenario 'and must be authenticated to edit some candidate' do
      candidate = create(:candidate)
      visit edit_candidate_path(candidate)
    end
    after :each do
      expect(current_path).to eq(root_path)
    end
  end
  context 'user' do
    before :each do
      user = User.create!(email: 'giovana@teste.com.br', password: '12345678')
      login_as user, scope: :user
    end
    scenario 'cannot view index unless logged in' do
      visit candidates_path
    end
    scenario 'and must be authenticated to see detals' do
      candidate = create(:candidate)
      visit candidate_path(candidate)
    end
    scenario 'and must be authenticated to create a new candidate' do
      visit new_candidate_path
    end
    scenario 'and must be authenticated to edit some candidate' do
      candidate = create(:candidate)
      visit edit_candidate_path(candidate)
    end
    after :each do
      expect(current_path).to eq(new_candidate_path)
    end
  end 
end
