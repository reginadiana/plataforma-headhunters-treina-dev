require 'rails_helper'

feature 'Headhunter edits job' do
  before :each do
    headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as headhunter, scope: :headhunter

    job_1 = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)

    visit job_opportunities_path
    click_on 'Desenvolvedor PHP'
    click_on 'Editar'
  end

  scenario 'successfully' do
    fill_in 'Titulo', with: 'Cientista de Dados'
    click_on 'Enviar Vaga'

    expect(page).to have_content('Cientista de Dados')
  end

  scenario 'and cannot be black' do
    fill_in 'Titulo', with: ''
    click_on 'Enviar Vaga'

    expect(page).to have_content('Titulo não pode ficar em branco')
  end

  scenario 'must be unique' do
    job_2 = create(:job_opportunity, title: 'Desenvolvedor GO')

    fill_in 'Titulo', with: 'Desenvolvedor GO'
    click_on 'Enviar Vaga'

    expect(page).to have_content('Titulo já está em uso')
  end

  scenario 'and deadline can not in past' do
    fill_in 'Data de Contratação', with: '04/06/1995'
    click_on 'Enviar Vaga'
    expect(page).to have_content('Data de Contratação não pode estar no passado')
  end

  scenario 'and return to list jobs' do
    click_on 'Voltar'

    expect(current_path).to eq job_opportunities_path
  end
  scenario 'and salary range must be a number' do
    fill_in 'Faixa Salárial', with: 'numero'
    click_on 'Enviar Vaga'
    expect(page).to have_content('Faixa Salárial não é um número')
  end
  scenario 'and salary_range must be greater than minimum wage' do
    fill_in 'Faixa Salárial', with: '1000'
    click_on 'Enviar Vaga'
    expect(page).to have_content('Faixa Salárial deve ser maior que 1045')
  end
end
