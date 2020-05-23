require 'rails_helper'

feature 'Visitor tries to acess seach and' do
	scenario 'cannot view index unless logged in' do
		visit search_candidates_path 
		expect(current_path).to eq(root_path)
	end
	scenario 'cannot view index unless logged in' do
		visit search_job_opportunities_path 
		expect(current_path).to eq(root_path)
	end
end
