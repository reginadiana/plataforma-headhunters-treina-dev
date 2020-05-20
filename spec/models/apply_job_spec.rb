require 'rails_helper'

RSpec.describe ApplyJob, type: :model do

	context "#message" do

		context "create successfully" do 
			it 'return message to apply job' do
				apply_job = create(:apply_job, message: "Eu, Bianca Rosa, brasileira, Operadora de CNC venho por meio desta me candidatar à vaga de Programador de CNC nesta empresa.")

				expect(apply_job.message).to eq "Eu, Bianca Rosa, brasileira, Operadora de CNC venho por meio desta me candidatar à vaga de Programador de CNC nesta empresa."

				expect(apply_job).to be_valid
			end
		end
	
		context "can not be blank" do 
			let(:apply_job) { build(:apply_job, message: "")}

			it 'and can not be valid' do
				expect(apply_job).to_not be_valid 	
			end
		end

		context "can not be bigger than 500 caracters" do
			let(:apply_job) { build(:apply_job, message: SecureRandom.base64(500))}

			it 'and can not be valid' do
				expect(apply_job).to_not be_valid 	
			end
		end
	end
end
