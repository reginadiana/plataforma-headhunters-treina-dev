require 'rails_helper'

feature 'Candidate sees the proposals by him' do
  before :each do
    user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
    login_as user, scope: :user
    @job_opportunity = create(:job_opportunity, title: 'Desenvolvedor FullStack')
    @candidate = create(:candidate, full_name: 'Fabio Akita', user: user)
  end
  scenario 'successfully' do
    proposal = create(:proposal, candidate: @candidate, job_opportunity: @job_opportunity)
    visit root_path
    click_on 'Minhas Propostas'
    expect(page).to have_content("#{proposal.job_opportunity.title}")
    expect(page).to have_content('Em espera')
  end
  scenario 'you have nothing to see' do
    visit root_path
    click_on 'Minhas Propostas'
    expect(page).to have_content('Nenhuma proposta foi enviada pra você')
  end
  scenario 'and view detals of job' do
    proposal = create(:proposal, candidate: @candidate, job_opportunity: @job_opportunity)
    visit root_path
    click_on 'Minhas Propostas'
    click_on "#{proposal.job_opportunity.title}"
    
    expect(current_path).to eq job_opportunity_path(@job_opportunity)
    expect(page).to have_content("#{proposal.job_opportunity.title}")
    expect(page).to have_content("#{proposal.job_opportunity.company}")
    expect(page).to have_content("#{proposal.job_opportunity.description_job}")
  end
end
