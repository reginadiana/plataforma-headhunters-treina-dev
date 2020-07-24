# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter view apply job of same job' do

	scenario 'successfully' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack", headhunter: headhunter)
		candidate = create(:candidate, full_name: 'Fabio Akita')

		apply_job = create(:apply_job, job_opportunity: job_opportunity, candidate: candidate)

		visit root_path
		click_on "Desenvolvedor FullStack"

		expect(page).to have_content("Candidatos")
		expect(page).to have_link("Fabio Akita")
	end

	scenario 'and nobody applied' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack", headhunter: headhunter)

		visit root_path
		click_on "Desenvolvedor FullStack"

		expect(page).to have_content("Candidatos")
		expect(page).to have_content("Nenhuma candidatura foi realizada")
	end

	scenario 'and view profile of candidate' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		job_opportunity = create(:job_opportunity, title: "Desenvolvedor FullStack", headhunter: headhunter)
		candidate = create(:candidate, full_name: 'Fabio Akita')

		apply_job = create(:apply_job, job_opportunity: job_opportunity, candidate: candidate)

		visit root_path
		click_on "Desenvolvedor FullStack"
		click_on "Fabio Akita"

		expect(current_path).to eq candidate_path(candidate)
	end
end
