require 'rails_helper'

feature 'Candidate delete profile' do

	scenario 'successfully' do
		user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as @user, scope: :user

		candidate = create(:candidate, user: user)

		visit candidate_path(candidate)
		click_on 'Deletar Perfil'

		expect(current_path).to eq new_candidate_path
	end
end
