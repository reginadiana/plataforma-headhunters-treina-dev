# frozen_string_literal: true

require 'rails_helper'

feature 'Headhunter tries to acess awnser proposal and must be authenticated' do

	before :each do
		headhunter = Headhunter.create!(email: 'giovana@gmail.com.br', password: '12345678')
		login_as headhunter, scope: :headhunter
	end

	after :each do
		expect(current_path).to eq(job_opportunities_path)
	end

  	scenario 'create a new awnser proposal' do
    		visit new_candidate_proposal_awnser_proposal_path(rand(1..100), rand(1..100))
   	end
        scenario 'edit some awnser proposal' do
		visit edit_candidate_proposal_awnser_proposal_path(rand(1..100), rand(1..100), rand(1..100))
   	end
end
