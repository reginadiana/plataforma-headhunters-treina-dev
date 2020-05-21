require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
	context "#successfully" do
		let(:job_opportunity) { build(:job_opportunity, 
		    title: "Desenvolvedor Rails",
		    company:  "Rebase", 
		    description_job:  "Desenvolvimento de Plataformas com TDD",
		    skills: "Domínio da linguagem Ruby e do framework Ruby on Rails",
		    deadline: "14/09/2020",
		    region: "Mocca - SP", 
		    benefits: "Vale refeição, Academia", 
		    office_functions: "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para atendimento do negócio.", 
		    company_expectations: "Profissional ativo e comunicativo" 
		)}

		it 'must be valid' do
			expect(job_opportunity.title).to eq "Desenvolvedor Rails"
			expect(job_opportunity.company).to eq "Rebase"
			expect(job_opportunity.description_job).to eq "Desenvolvimento de Plataformas com TDD"
			expect(job_opportunity.skills).to eq "Domínio da linguagem Ruby e do framework Ruby on Rails"
			expect(job_opportunity.region).to eq "Mocca - SP"
			expect(job_opportunity.benefits).to eq "Vale refeição, Academia"
			expect(job_opportunity.office_functions).to eq "Contribuir com a evolução arquitetural do software visando manutenibilidade e flexibilização para atendimento do negócio."
			expect(job_opportunity.company_expectations).to eq "Profissional ativo e comunicativo"

			expect(job_opportunity).to be_valid 	
		end
	end

	context "#deadline cannot be in past" do
		let(:job_opportunity) { build(:job_opportunity, deadline: Date.today - 1)}

		it 'and can not be valid' do
			expect(job_opportunity).to_not be_valid 	
		end
	end

	context "#salary range can not be less than 1045" do
		let(:job_opportunity) { build(:job_opportunity, salary_range: 0)}

		it 'and can not be valid' do
			expect(job_opportunity).to_not be_valid 	
		end
	end

	context "#title must be unique" do

		before :each do 
			job_opportunity = create(:job_opportunity, title: "Desenvolvedor Rails")
		end

		let(:other_job_opportunity) { build(:job_opportunity, title: "Desenvolvedor Rails")}

		it 'and can not be valid' do
			expect(other_job_opportunity).to_not be_valid 	
		end
	end

	context "#can not be bigger than 4000 caracters" do

		context "#description job" do 
			let(:job_opportunity) { build(:job_opportunity, description_job: SecureRandom.base64(5000))}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
		context "#office functions" do 
			let(:job_opportunity) { build(:job_opportunity, office_functions: SecureRandom.base64(5000))}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
		context "#benefits" do 
			let(:job_opportunity) { build(:job_opportunity, benefits: SecureRandom.base64(5000))}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
		context "#company expectations" do 
			let(:job_opportunity) { build(:job_opportunity, company_expectations: SecureRandom.base64(5000))}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
	end

	context "#can not be blank" do
	
		context "#title" do 
			let(:job_opportunity) { build(:job_opportunity, title: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end

		context "#company" do 
			let(:job_opportunity) { build(:job_opportunity, company: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end

		context "#description_job" do 
			let(:job_opportunity) { build(:job_opportunity, description_job: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end

		context "#skills" do 
			let(:job_opportunity) { build(:job_opportunity, skills: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end

		context "#salary_range" do 
			let(:job_opportunity) { build(:job_opportunity, salary_range: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end

		context "#deadline" do 
			let(:job_opportunity) { build(:job_opportunity, deadline: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
		context "#region" do 
			let(:job_opportunity) { build(:job_opportunity, region: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
		context "#office_functions" do 
			let(:job_opportunity) { build(:job_opportunity, office_functions: "")}

			it 'and can not be valid' do
				expect(job_opportunity).to_not be_valid 	
			end
		end
	end
end
