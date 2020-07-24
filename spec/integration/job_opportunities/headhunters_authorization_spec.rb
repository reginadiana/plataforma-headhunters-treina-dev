# frozen_string_literal: true

require 'rails_helper'

feature 'Other headhunter can not' do
	before :each do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		@job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP', headhunter: headhunter)

		other_headhunter = Headhunter.create!(email: 'carla@gmail.com', password: '12345678')
		login_as other_headhunter, scope: :headhunter
	end

	scenario 'to edit job that is not yours by route' do
		visit edit_job_opportunity_path(@job_opportunity)
		expect(current_path).to eq(job_opportunities_path)
	end

	scenario 'see job that is not yours' do
		visit root_path
		expect(page).not_to have_link 'Desenvolvedor PHP'
	end

	scenario 'see job that is not yours by route' do

		visit job_opportunity_path(@job_opportunity)
		expect(current_path).to eq(job_opportunities_path)
	end
end

