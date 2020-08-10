require 'rails_helper'

feature 'Headhunter register valid comment' do
  before :each do
    headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    candidate = create(:candidate)

    visit candidate_path(candidate)

    click_on 'Deixar Comentário'
  end

  scenario 'successfully' do
    fill_in 'Conteúdo do Comentário', with: 'Podemos marcar uma entrevista?'

    click_on 'Publicar'

    expect(page).to have_content('Comentário publicado com sucesso')

    expect(page).to have_content('Podemos marcar uma entrevista?')
  end

  scenario 'and can not be blank' do
    fill_in 'Conteúdo do Comentário', with: ''

    click_on 'Publicar'

    expect(page).to have_content('Conteúdo do Comentário não pode ficar em branco')
  end
end
