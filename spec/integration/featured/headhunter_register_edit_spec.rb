# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter mark profile as featured' do

	before :each do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, headhunter: headhunter, title: 'Desenvolvedor React')

		candidate = create(:candidate, full_name: 'Lais Lima')
		apply_job = create(:apply_job, candidate: candidate, job_opportunity: job_opportunity)

		visit job_opportunities_path
		click_on 'Desenvolvedor React'

		expect(page).to have_content('Lais Lima')
		click_on 'Marcar como Destaque'
	end

	scenario 'successfully' do
		expect(page).to have_content('Perfil Destaque')
	end

	scenario 'and remove before' do

		click_on 'Marcar como Destaque'
		expect(page).not_to have_content('Perfil Destaque')
	end
end
