require 'rails_helper'

feature 'Headhunter visit list of candidates' do
  context 'successfully' do
    before :each do
      headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as headhunter, scope: :headhunter

      candidate = create(:candidate, full_name: 'Iara', profession: 'Analista de Sistemas')
      candidate = create(:candidate, full_name: 'Lucas', profession: 'Analista de Sistemas JR')
      candidate = create(:candidate, full_name: 'Juca', profession: 'Desenvolvedor Frontend')

      visit candidates_path
      expect(page).to have_content('Encontre o Melhor Perfil')
    end

    scenario 'and search for candidate by profession' do
      fill_in 'Busca', with: 'Analista de Sistemas'
      click_on 'Pesquisar'

      expect(current_path).to eq search_candidates_path
      expect(page).to have_content('Iara')
      expect(page).to have_content('Analista de Sistemas')
      expect(page).to have_content('Lucas')
      expect(page).to have_content('Analista de Sistemas JR')

      expect(page).not_to have_content('Juca')
      expect(page).not_to have_content('Desenvolvedor Frontend')
    end

    scenario 'and search for candidate by partial name' do
      fill_in 'Busca', with: 'Iara'
      click_on 'Pesquisar'

      expect(current_path).to eq search_candidates_path
      expect(page).to have_content('Iara')
      expect(page).to have_content('Analista de Sistemas')

      expect(page).not_to have_content('Lucas')
      expect(page).not_to have_content('Analista de Sistemas JR')
      expect(page).not_to have_content('Juca')
      expect(page).not_to have_content('Desenvolvedor Frontend')
    end
  end

  context 'can not found' do
    before :each do
      @headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
      login_as @headhunter, scope: :headhunter

      visit candidates_path
      expect(page).to have_content('Encontre o Melhor Perfil')
    end

    scenario 'because is blank' do
      fill_in 'Busca', with: ''
      click_on 'Pesquisar'

      expect(page).to have_link 'Voltar'
      expect(page).to have_content('Nenhum resultado encontrado para:')
    end

    scenario 'because name not exist' do
      fill_in 'Busca', with: 'Ana'
      click_on 'Pesquisar'

      expect(page).to have_link 'Voltar'
      expect(page).to have_content('Nenhum resultado encontrado para: Ana')
    end
  end
end
