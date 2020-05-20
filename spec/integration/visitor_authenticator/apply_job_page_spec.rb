require 'rails_helper'

feature 'Visitor tries to acess apply jobs and' do

	after :each do
		expect(current_path).to eq(root_path)
	end

	scenario 'cannot view index unless logged in' do
		visit apply_jobs_path
	end

        scenario 'and must be authenticated to see detals' do
		visit job_opportunity_apply_job_path(rand(1..100), rand(1..100))
   	end
  	scenario 'and must be authenticated to create a apply job' do

    		visit new_job_opportunity_apply_job_path(rand(1..100))
   	end 
        scenario 'and must be authenticated to edit some apply job' do
		visit edit_job_opportunity_apply_job_path(rand(1..100), rand(1..100))
   	end
end
