require 'rails_helper'

feature 'Candidate view your profile' do

	before :each do
		user = User.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as @user, scope: :user

		@candidate = create(:candidate, user: user)

	end

	scenario 'successfully' do    
		visit candidate_path(@candidate)
		expect(page).to have_content("#{@candidate.full_name}")
		expect(page).to have_content("#{@candidate.social_name}")
		expect(page).to have_content("#{@candidate.date_of_birth}")
		expect(page).to have_content("#{@candidate.profession}")
		expect(page).to have_content("#{@candidate.profile_description}")
		expect(page).to have_content("#{@candidate.experience}")
		expect(page).to have_content("#{@candidate.level.name}")
		expect(page).to have_content("#{@candidate.formation}")
		expect(page).to have_content("#{@candidate.courses}")
		expect(page).to have_content("#{@user.email}")

		expect(page).to have_link "editar-#{@candidate.id}"
		expect(page).to have_link "delete-#{@candidate.id}"
	end

	scenario 'and return to home page' do
		click_on "Voltar"
		expect(current_path).to eq job_opportunities_path
	end
end
