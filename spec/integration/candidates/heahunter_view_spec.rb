require 'rails_helper'

feature 'Headhunter view candidate profile' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    candidate_a = create(:candidate, full_name: 'Thiago Ventura')
    candidate_b = create(:candidate, full_name: 'Fabio Akita')

    visit root_path
    click_on 'Lista de Candidatos'

    expect(current_path).to eq candidates_path

    expect(page).to have_content('Thiago Ventura')
    expect(page).to have_content(candidate_a.profession.to_s)
    expect(page).to have_content(candidate_a.level.name.to_s)

    expect(page).to have_content('Fabio Akita')
    expect(page).to have_content(candidate_b.profession.to_s)
    expect(page).to have_content(candidate_b.level.name.to_s)
  end

  scenario 'and any profile was register' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Lista de Candidatos'

    expect(page).to have_content('Nenhum perfil cadastrado')
  end

  scenario 'and view details' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    candidate = create(:candidate, full_name: 'Thiago Ventura')

    visit root_path
    click_on 'Lista de Candidatos'
    click_on 'Thiago Ventura'

    expect(current_path).to eq candidate_path(candidate)

    expect(page).to have_content(candidate.full_name.to_s)
    expect(page).to have_content(candidate.social_name.to_s)
    expect(page).to have_content(candidate.level.name.to_s)
    expect(page).to have_content(candidate.profession.to_s)
    expect(page).to have_content(candidate.profile_description.to_s)
    expect(page).to have_content I18n.l(candidate.date_of_birth, format: :long)
    expect(page).to have_content(candidate.experience.to_s)
    expect(page).to have_content(candidate.formation.to_s)
    expect(page).to have_content(candidate.courses.to_s)

    expect(page).not_to have_link 'Editar Perfil'
    expect(page).not_to have_link 'Deletar Perfil'
  end

  scenario 'and return to home page' do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    candidate = create(:candidate, full_name: 'Thiago Ventura')

    visit root_path
    click_on 'Lista de Candidatos'
    click_on 'Thiago Ventura'
    click_on 'Voltar'

    expect(current_path).to eq candidates_path
  end
end
