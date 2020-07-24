# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter register a proposal' do
  before :each do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter
    @job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
    @candidate = create(:candidate, full_name: 'Camila de Melo')
    visit root_path
    click_on 'Lista de Candidatos'
    click_on 'Camila de Melo'
  end
  scenario 'successfully' do
    click_on 'Enviar Proposta'
    fill_in 'Conteúdo da Proposta', with: 'Ola, podemos marcar uma entrevista?'
    select 'Desenvolvedor PHP', from: 'Vaga'
    click_on 'Publicar'
    expect(page).to have_content('Proposta enviada com sucesso')
  end
  scenario 'and cannot send again' do
    proposal = create(:proposal, candidate: @candidate, job_opportunity: @job_opportunity)
    click_on 'Enviar Proposta'
    expect(page).to have_content('Uma proposta para esta vaga já foi enviada')
  end
end
