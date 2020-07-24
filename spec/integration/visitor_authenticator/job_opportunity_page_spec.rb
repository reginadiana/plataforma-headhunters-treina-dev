# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor and user tries to acess jobs and' do
  context 'visitor' do
    scenario 'cannot view index unless logged in' do
      visit job_opportunities_path
      expect(page).not_to have_link('Vagas Cadastradas')
    end
    scenario 'and must be authenticated to see detals' do
      job_opportunity = create(:job_opportunity)
      visit job_opportunity_path(job_opportunity)
    end
    scenario 'and must be authenticated to create a new job' do
      visit new_job_opportunity_path
    end
    scenario 'and must be authenticated to edit some job' do
      job_opportunity = create(:job_opportunity)
      visit edit_job_opportunity_path(job_opportunity)
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
      visit job_opportunities_path
      expect(page).not_to have_link('Vagas Cadastradas')
    end
    scenario 'and must be authenticated to see detals' do
      job_opportunity = create(:job_opportunity)
      visit job_opportunity_path(job_opportunity)
    end
    scenario 'and must be authenticated to create a new job' do
      visit new_job_opportunity_path
    end
    scenario 'and must be authenticated to edit some job' do
      job_opportunity = create(:job_opportunity)
      visit edit_job_opportunity_path(job_opportunity)
    end
    after :each do
      expect(current_path).to eq(new_candidate_path)
    end
  end
end
