# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter view comments' do

	scenario 'successfully' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		candidate = create(:candidate, full_name: 'Thiago Ventura')
		comment = create(:comment,
				content: 'Ola, podemos marcar uma entrevista?',
				headhunter: headhunter, candidate: candidate)

		visit candidate_path(candidate)
		expect(page).to have_content("#{comment.content}")
	end

	scenario 'and can not see comments of other headhunter' do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter

		candidate = create(:candidate, full_name: 'Thiago Ventura')
		comment = create(:comment,
				content: 'Ola, podemos marcar uma entrevista?', candidate: candidate)

		visit candidate_path(candidate)

		expect(page).not_to have_content("#{comment.content}")
	end
end
