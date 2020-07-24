# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate authorization' do
  context 'candidate can not' do
    before :each do
      user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
      @candidate = create(:candidate, user: user)
      login_as user, scope: :user
    end

    scenario 'see list of candidates by route' do
      visit candidates_path
      expect(current_path).to eq(candidate_path(@candidate))
    end
  end

  context 'other candidate can not' do
    before :each do
      user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
      @candidate = create(:candidate, user: user)

      other_user = User.create!(email: 'juliano@gmail.com', password: '12345678')
      login_as other_user, scope: :user
      @other_candidate = create(:candidate, user: other_user)
    end

    scenario 'see list of candidates by route' do
      visit candidates_path
      expect(current_path).to eq(candidate_path(@other_candidate))
    end

    scenario 'to edit profile that is not yours by route' do
      visit edit_candidate_path(@candidate)
      expect(current_path).to eq(candidate_path(@other_candidate))
    end

    scenario 'see profile that is not yours by route' do
      visit candidate_path(@candidate)
      expect(current_path).to eq(candidate_path(@other_candidate))
    end
  end
end
