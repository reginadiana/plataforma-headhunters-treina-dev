require 'rails_helper'

feature 'Candidates view comments' do
  xscenario 'successfully' do
    user = User.create!(email: 'thiago@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate = create(:candidate, user: user, full_name: 'Thiago Ventura')

    comment = create(:comment,
                     content: 'Ola, podemos marcar uma entrevista?', candidate: candidate)

    visit candidate_path(candidate)

    expect(page).to have_content(comment.content.to_s)
  end

  xscenario 'and can not see comments of other candidate' do
    user = User.create!(email: 'thiago@gmail.com.br', password: '12345678')
    login_as user, scope: :user

    candidate_a = create(:candidate, user: user, full_name: 'Thiago Ventura')
    candidate_b = create(:candidate, full_name: 'Luana Mendes')

    comment = create(:comment,
                     content: 'Ola, podemos marcar uma entrevista?', candidate: candidate_b)

    visit candidate_path(candidate_a)

    expect(page).not_to have_content(comment.content.to_s)
  end
end
