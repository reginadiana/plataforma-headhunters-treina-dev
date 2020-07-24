# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter deletes jobs' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)

    visit job_opportunities_path
    click_on 'Desenvolvedor PHP'
    click_on 'Encerrar Vaga'

    expect(current_path).to eq job_opportunities_path
    expect(page).to have_content('Nenhuma vaga cadastrada')
  end

  scenario 'and keep anothers' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)
    create(:job_opportunity, title: 'Desenvolvedor Java', headhunter: headhunter)

    visit job_opportunities_path
    click_on 'Desenvolvedor PHP'
    click_on 'Encerrar Vaga'

    expect(current_path).to eq job_opportunities_path

    expect(page).not_to have_content('Desenvolvedor PHP')
    expect(page).to have_content('Desenvolvedor Java')
  end
end
