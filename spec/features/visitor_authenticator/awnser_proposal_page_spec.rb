require 'rails_helper'

feature 'Visitor tries to acess awnser proposal and must be authenticated to' do

	after :each do
		expect(current_path).to eq(root_path)
	end

  	scenario 'create a new awnser proposal' do
    		visit new_candidate_proposal_awnser_proposal_path(rand(1..100), rand(1..100))
   	end
        scenario 'edit some awnser proposal' do
		visit edit_candidate_proposal_awnser_proposal_path(rand(1..100), rand(1..100), rand(1..100))
   	end
end
