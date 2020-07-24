require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_link 'Home'
    expect(page).to have_content('Encontrar um novo desafio profissional')
    expect(page).to have_content('Acertar em cheio em cada contratação')
    expect(page).to have_link 'Sou candidato'
    expect(page).to have_link 'Sou recrutador'
    expect(page).not_to have_link 'Sair'
  end
end
