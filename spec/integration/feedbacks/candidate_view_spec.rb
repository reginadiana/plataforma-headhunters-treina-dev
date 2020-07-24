# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate view feedback' do

	before :each do
		user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as user, scope: :user

		candidate = create(:candidate, user: user)
		@apply_job = create(:apply_job, candidate: candidate)
		@feedback = create(:feedback,
			apply_job: @apply_job,
			message: 'Ola, gostaria de marcar uma entrevista!')

		visit apply_jobs_path

	end

	scenario 'successfully' do

		expect(page).to have_content("#{@apply_job.job_opportunity.title}")
		expect(page).to have_content("#{@apply_job.feedback}")
	end

	scenario 'in detals of candidature ' do
		click_on "#{@apply_job.job_opportunity.title}"
		click_on 'Ver minha candidatura'

		expect(page).to have_content('Status do Processo')
		expect(page).to have_content("#{@apply_job.feedback}")

		expect(page).to have_content('Feedback do Recrutador')
		expect(page).to have_content("#{@feedback.message}")
	end
end
