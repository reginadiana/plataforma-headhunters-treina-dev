require 'rails_helper'

feature 'Candidate can not' do
  before :each do
    @job_opportunity = create(:job_opportunity, title: 'Cientista de Dados')
    user = create(:user)
    login_as user, scope: :user
    candidate = create(:candidate, user: user)
  end

  scenario 'to create some job by route' do
    visit new_job_opportunity_path
    expect(current_path).to eq(job_opportunities_path)
  end

  scenario 'to edit some job by route' do
    visit edit_job_opportunity_path(@job_opportunity)
    expect(current_path).to eq(job_opportunities_path)
  end

  scenario 'register valid job' do
    visit root_path

    expect(page).to have_content('Cientista de Dados')
    expect(page).not_to have_link 'Cadastrar nova Vaga'
  end

  scenario 'edit job' do
    visit root_path
    click_on 'Cientista de Dados'

    expect(page).not_to have_link 'Editar'
  end
  scenario 'delete job' do
    visit root_path
    click_on 'Cientista de Dados'

    expect(page).not_to have_link 'Excluir'
  end
end
