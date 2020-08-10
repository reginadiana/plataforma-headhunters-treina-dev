require 'rails_helper'

feature 'Candidate view jobs' do
  scenario 'successfully' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP')
    job_2 = create(:job_opportunity, title: 'Desenvolvedor Java')

    visit root_path

    expect(page).to have_content('Vagas Cadastradas')
    expect(page).not_to have_link('Cadastrar nova Vaga')
    expect(page).not_to have_link('Lista de Candidatos')

    expect(page).to have_content('Desenvolvedor PHP')
    expect(page).to have_link "details-#{job_1.id}"

    expect(page).to have_content('Desenvolvedor Java')
    expect(page).to have_link "details-#{job_2.id}"
  end

  scenario 'and any job was register' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    visit root_path

    expect(page).to have_content('Vagas Cadastradas')
    expect(page).to have_content('Nenhuma vaga cadastrada')
  end

  scenario 'and view details' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP', salary_range: 5000)

    visit root_path
    find("a#details-#{job_1.id}").click

    expect(page).to have_content('Desenvolvedor PHP')
    expect(page).to have_content(job_1.company.to_s)
    expect(page).to have_content(job_1.region.to_s)
    expect(page).to have_content('R$ 5.000,00')
    expect(page).to have_content(job_1.level.name.to_s)
    expect(page).to have_content(job_1.description_job.to_s)
    expect(page).to have_content(job_1.skills.to_s)
    expect(page).to have_content I18n.l(job_1.deadline)
    expect(page).to have_content(job_1.benefits.to_s)
    expect(page).to have_content(job_1.office_functions.to_s)
    expect(page).to have_content(job_1.company_expectations.to_s)

    expect(page).to have_link 'Quero me candidatar'
    expect(page).not_to have_link "edit-#{job_1.id}"
    expect(page).not_to have_link "delete-#{job_1.id}"
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP')

    visit root_path
    find("a#details-#{job_1.id}").click
    click_on 'Voltar'

    expect(current_path).to eq job_opportunities_path
  end
end
