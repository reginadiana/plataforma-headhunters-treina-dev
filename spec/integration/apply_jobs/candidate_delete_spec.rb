# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate delete message of apply for job' do

   before :each do
      user = User.create!(email: 'fabio@gmail.com.br', password: '12345678')
      login_as user, scope: :user

      @job_opportunity = create(:job_opportunity, title: 'Desenvolvedor FullStack')
      candidate = create(:candidate, user: user)

      apply_job = create(:apply_job, candidate: candidate, job_opportunity: @job_opportunity)
      @other_apply_job = create(:apply_job, candidate: candidate)

      visit root_path

      expect(current_path).to eq job_opportunities_path
      click_on 'Desenvolvedor FullStack'
      click_on 'Ver minha candidatura'
      click_on 'Retirar minha candidatura'
   end

   scenario 'successfully' do

      expect(current_path).to eq job_opportunity_path(@job_opportunity)
      expect(page).to have_content('Candidatura encerrada')
      expect(page).to have_link('Quero me candidatar')
   end

   scenario 'and keep anothers' do

      click_on 'Voltar'
      click_on "#{@other_apply_job.job_opportunity.title}"

      expect(page).to have_content('Você se candidatou para esta vaga')
   end
end
