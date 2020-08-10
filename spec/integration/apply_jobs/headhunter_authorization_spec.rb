require 'rails_helper'

feature 'Headhunter tries to acess apply jobs and must be authenticated' do
  before :each do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter
  end

  after :each do
    expect(current_path).to eq(job_opportunities_path)
  end

  scenario 'cannot view index unless logged in' do
    visit apply_jobs_path
  end
  scenario 'to create a apply job' do
    visit new_job_opportunity_apply_job_path(rand(1..100))
  end
  scenario 'to edit some apply job' do
    visit edit_job_opportunity_apply_job_path(rand(1..100), rand(1..100))
  end
end
