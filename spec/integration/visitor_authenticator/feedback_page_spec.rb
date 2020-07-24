require 'rails_helper'

feature 'Visitor tries to acess feedbacks and must be authenticated to' do
  context 'visitor' do
    scenario 'create a feedback' do
      visit new_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100))
    end
    scenario 'edit some apply job' do
      visit edit_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100), rand(1..100))
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
    scenario 'create a feedback' do
      visit new_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100))
    end
    scenario 'edit some apply job' do
      visit edit_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100), rand(1..100))
    end
    after :each do
      expect(current_path).to eq(new_candidate_path)
    end
  end
end
