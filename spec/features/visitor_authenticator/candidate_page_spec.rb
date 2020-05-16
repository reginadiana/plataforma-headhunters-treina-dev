require 'rails_helper'

feature 'Visitor tries to acess profile candidates and' do

	after :each do
		expect(current_path).to eq(root_path)
	end

	scenario 'cannot view index unless logged in' do
		visit candidates_path
	end

        scenario 'and must be authenticated to see detals' do
		candidate = create(:candidate)

		visit candidate_path(candidate)
   	end
  	scenario 'and must be authenticated to create a new candidate' do
    		visit new_candidate_path
   	end
        scenario 'and must be authenticated to edit some candidate' do
		candidate = create(:candidate)

		visit edit_candidate_path(candidate)
   	end
end
