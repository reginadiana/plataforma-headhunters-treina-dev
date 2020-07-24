# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter edit an interview' do
  before :each do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user
    candidate = create(:candidate, user: user)

    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP')
    other_job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Java')
    interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate,
                                   address: 'Rua Vergueiro, 11')
    create(:interview, job_opportunity: other_job_opportunity, candidate: candidate,
                                         address: 'Rua Ita, 11')

    visit root_path
    click_on 'Minhas Entrevistas'
    click_on "edit-interview-#{interview.id}"
  end

  scenario 'successfully' do
    fill_in 'Data', with: '13/11/2021'
    fill_in 'Hora', with: '17:20'

    click_on 'Convidar'

    expect(page).to have_content('Entrevista atualizada com sucesso')
  end

  scenario 'can not be blank' do
    fill_in 'Data', with: ''
    fill_in 'Hora', with: ''
    fill_in 'Endereço', with: ''

    click_on 'Convidar'

    expect(page).to have_content('Data não pode ficar em branco')
    expect(page).to have_content('Hora não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end

  scenario 'and date can not in past' do
    fill_in 'Data', with: '04/06/2019'
    click_on 'Convidar'
    expect(page).to have_content('Data não pode estar no passado')
  end

  scenario 'and keep informations of other interviews' do
    fill_in 'Endereço', with: 'Rua Chaves, 11'
    click_on 'Convidar'

    expect(page).to have_content('Desenvolvedor PHP')
    expect(page).to have_content('Rua Chaves, 11')
    expect(page).to have_content('Desenvolvedor Java')
    expect(page).to have_content('Rua Ita, 11')
  end
end
