require 'rails_helper'

feature 'Candidate view your profile' do
  scenario 'successfully' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    visit candidate_path(candidate)

    expect(page).to have_content(candidate.full_name.to_s)
    expect(page).to have_content(candidate.social_name.to_s)
    expect(page).to have_content I18n.l(candidate.date_of_birth, format: :long)
    expect(page).to have_content(candidate.profession.to_s)
    expect(page).to have_content(candidate.profile_description.to_s)
    expect(page).to have_content(candidate.experience.to_s)
    expect(page).to have_content(candidate.level.name.to_s)
    expect(page).to have_content(candidate.formation.to_s)
    expect(page).to have_content(candidate.courses.to_s)
    expect(page).to have_content(user.email.to_s)

    expect(page).to have_link 'Editar Perfil'
    expect(page).to have_link 'Deletar Perfil'
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user)

    visit candidate_path(candidate)

    click_on 'Voltar'
    expect(current_path).to eq job_opportunities_path
  end
end
