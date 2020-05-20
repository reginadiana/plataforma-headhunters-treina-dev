require 'rails_helper'

feature 'Visitor tries to acess proposals and must be authenticated to' do

	after :each do
		expect(current_path).to eq(root_path)
	end

	scenario 'cannot view index unless logged in' do
		visit candidate_proposals_path(rand(1..100)) 
	end

  	scenario 'create a proposal' do

    		visit new_candidate_proposal_path(rand(1..100))
   	end 
        scenario 'edit some proposal' do
		visit edit_candidate_proposal_path(rand(1..100), rand(1..100))
   	end
end
