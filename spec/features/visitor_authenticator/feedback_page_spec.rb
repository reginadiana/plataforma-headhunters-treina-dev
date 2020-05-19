require 'rails_helper'

feature 'Visitor tries to acess feedbacks and must be authenticated to' do

	after :each do
		expect(current_path).to eq(root_path)
	end

  	scenario 'create a feedback' do
    		visit new_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100))
   	end 
        scenario 'edit some apply job' do
		visit edit_job_opportunity_apply_job_feedback_path(rand(1..100), rand(1..100), rand(1..100))
   	end
end
