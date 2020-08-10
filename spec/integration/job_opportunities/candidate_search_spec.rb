require 'rails_helper'

feature 'Candidate visit list of jobs' do
  context 'successfully' do
    before :each do
      user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as user, scope: :user
      candidate = create(:candidate, user: user)

      job_opportunity = create(:job_opportunity,
                               title: 'Desenvolvedor Frontend', skills: 'React, Java Script e Linux')
      other_job_opportunity = create(:job_opportunity,
                                     title: 'Desenvolvedor Backend', skills: 'Rails, Postgresql e Linux')

      visit job_opportunities_path
    end

    scenario 'and search for job by title' do
      fill_in 'Busca', with: 'Frontend'
      click_on 'Pesquisar'

      expect(current_path).to eq search_job_opportunities_path
      expect(page).to have_content('Desenvolvedor Frontend')
      expect(page).not_to have_content('Desenvolvedor Backend')
    end

    scenario 'and search for candidate by partial skills' do
      fill_in 'Busca', with: 'Linux'
      click_on 'Pesquisar'

      expect(current_path).to eq search_job_opportunities_path
      expect(page).to have_content('Desenvolvedor Frontend')
      expect(page).to have_content('Desenvolvedor Backend')
    end
  end

  context 'can not found' do
    before :each do
      user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as user, scope: :user
      @candidate = create(:candidate, user: user)

      visit job_opportunities_path
    end

    scenario 'because is blank' do
      fill_in 'Busca', with: ''
      click_on 'Pesquisar'

      expect(page).to have_link 'Voltar'
      expect(page).to have_content('Nenhum resultado encontrado para:')
    end

    scenario 'because name not exist' do
      fill_in 'Busca', with: 'Github'
      click_on 'Pesquisar'

      expect(page).to have_link 'Voltar'
      expect(page).to have_content('Nenhum resultado encontrado para: Github')
    end
    scenario 'other candidates' do
      visit search_candidates_path('Camila')
      expect(current_path).to eq(candidate_path(@candidate))
    end
  end
end
