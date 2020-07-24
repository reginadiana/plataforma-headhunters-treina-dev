require 'rails_helper'

feature 'Visitor tries to acess interviews and must be authenticated to' do
  context 'visitor' do
    scenario 'view all interviews' do
      visit interviews_path
    end
    scenario 'view all interviews to same job' do
      visit job_opportunity_interview_path(rand(1..100), rand(1..100))
    end
    scenario 'create a new interviews' do
      visit new_job_opportunity_candidate_interview_path(rand(1..100), rand(1..100))
    end
    scenario 'edit some interviews' do
      visit edit_job_opportunity_candidate_interview_path(rand(1..100), rand(1..100), rand(1..100))
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
    scenario 'view all interviews to same job' do 
      visit job_opportunity_interview_path(rand(1..100), rand(1..100))
    end
    scenario 'create a new interviews' do
      visit new_job_opportunity_candidate_interview_path(rand(1..100), rand(1..100))
    end
    scenario 'edit some interviews' do
      visit edit_job_opportunity_candidate_interview_path(rand(1..100), rand(1..100), rand(1..100))
    end
    after :each do
      expect(current_path).to eq(new_candidate_path)
    end
  end
end
