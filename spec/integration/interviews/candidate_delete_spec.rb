# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate delete an interview' do
  scenario 'successfully and keep anothers' do
    user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
    login_as user, scope: :user
    candidate = create(:candidate, user: user)

    job_opportunity = create(:job_opportunity, title: 'Desenvolvedor Java')
    other_job_opportunity = create(:job_opportunity, title: 'Desenvolvedor PHP')

    interview = create(:interview, job_opportunity: job_opportunity, candidate: candidate)
    other_interview = create(:interview,
                             job_opportunity: other_job_opportunity, candidate: candidate)

    visit root_path
    click_on 'Minhas Entrevistas'
    click_on "delete-interview-#{interview.id}"

    expect(page).to have_content('Desenvolvedor PHP')
    expect(page).to have_content I18n.l(other_interview.interview_date, format: :short)
    expect(page).to have_content I18n.l(other_interview.hour, format: :short)
    expect(page).to have_content(other_interview.address.to_s)

    expect(page).to have_link("delete-interview-#{other_interview.id}")
    expect(page).to have_link("edit-interview-#{other_interview.id}")
  end
end
