# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter register a feedback' do
  before :each do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    @job_opportunity = create(:job_opportunity, headhunter: headhunter, title: 'Desenvolvedor React')

    candidate = create(:candidate, full_name: 'Lais Lima')
    @apply_job = create(:apply_job, candidate: candidate, job_opportunity: @job_opportunity)

    @reject = create(:choice, option: 'Recusar')

    visit job_opportunities_path
    click_on 'Desenvolvedor React'

    expect(page).to have_content('Lais Lima')
  end

  context 'register' do
    before :each do
      create(:choice, option: 'Aceitar')
      click_on 'Enviar Feedback'
      expect(current_path).to eq new_job_opportunity_apply_job_feedback_path(@job_opportunity, @apply_job)
    end

    scenario 'as accepted successfully' do
      fill_in 'Mensagem de Feedback', with: 'Ola, podemos marcar uma entrevista?'
      select 'Aceitar', from: 'Escolha'

      click_on 'Enviar Feedback'

      expect(page).to have_content('Feedback enviado com sucesso')
      expect(page).to have_content('Lais Lima')
      expect(page).to have_content('Aceito')
    end

    scenario 'as reject successfully' do
      select 'Recusar', from: 'Escolha'

      click_on 'Enviar Feedback'

      expect(page).to have_content('Feedback enviado com sucesso')
      expect(page).to have_content('Lais Lima')
      expect(page).to have_content('Rejeitado')
    end
  end

  context 'edit' do
    before :each do
      create(:feedback, apply_job: @apply_job)

      click_on 'Enviar Feedback'
    end

    scenario 'and can edit to reject' do
      fill_in 'Mensagem de Feedback', with: 'Ola, por enquanto nao estamos procurando este perfil'
      select 'Recusar', from: 'Escolha'

      click_on 'Enviar Feedback'

      expect(page).to have_content('Feedback atualizado com sucesso')
      expect(page).to have_content('Lais Lima')
      expect(page).to have_content('Rejeitado')
    end

    scenario 'and can edit to accepted' do
      select 'Aceitar', from: 'Escolha'

      click_on 'Enviar Feedback'

      expect(page).to have_content('Feedback atualizado com sucesso')
      expect(page).to have_content('Aceito')
    end
  end
end
