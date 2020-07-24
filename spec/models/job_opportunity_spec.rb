# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  context '#successfully' do
    let(:job_opportunity) do
      @job = build(:job_opportunity, title: SecureRandom.base64(50),
                              company: SecureRandom.base64(50),
                              description_job: SecureRandom.base64(100),
                              skills: SecureRandom.base64(100),
                              deadline: '14/09/2020',
                              region: 'Mocca - SP',
                              benefits: SecureRandom.base64(80),
                              office_functions: SecureRandom.base64(200),
                              company_expectations: SecureRandom.base64(100))
    end

    it 'must be valid' do
      expect(job_opportunity.title).to eq @job.title
      expect(job_opportunity.company).to eq @job.company
      expect(job_opportunity.description_job).to eq @job.description_job
      expect(job_opportunity.skills).to eq @job.skills
      expect(job_opportunity.region).to eq 'Mocca - SP'
      expect(job_opportunity.benefits).to eq @job.benefits
      expect(job_opportunity.office_functions).to eq @job.office_functions
      expect(job_opportunity.company_expectations).to eq @job.company_expectations

      expect(job_opportunity).to be_valid
    end
  end

  context '#deadline cannot be in past' do
    let(:job_opportunity) { build(:job_opportunity, deadline: Date.today - 1) }
    it 'and can not be valid' do
      expect(job_opportunity).to_not be_valid
    end
  end
  context '#salary range can not be less than 1045' do
    let(:job_opportunity) { build(:job_opportunity, salary_range: 0) }
    it 'and can not be valid' do
      expect(job_opportunity).to_not be_valid
    end
  end
  context '#title must be unique' do
    before :each do
      create(:job_opportunity, title: 'Desenvolvedor Rails')
    end
    let(:other_job_opportunity) { build(:job_opportunity, title: 'Desenvolvedor Rails') }
    it 'and can not be valid' do
      expect(other_job_opportunity).to_not be_valid
    end
  end
  context '#can not be bigger than 4000 caracters' do
    context '#description job' do
      let(:job_opportunity) { build(:job_opportunity, description_job: SecureRandom.base64(5000)) }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#office functions' do
      let(:job_opportunity) { build(:job_opportunity, office_functions: SecureRandom.base64(5000)) }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#benefits' do
      let(:job_opportunity) { build(:job_opportunity, benefits: SecureRandom.base64(5000)) }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#company expectations' do
      let(:job_opportunity) { build(:job_opportunity, company_expectations: SecureRandom.base64(5000)) }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
  end
  context '#can not be blank' do
    context '#title' do
      let(:job_opportunity) { build(:job_opportunity, title: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#company' do
      let(:job_opportunity) { build(:job_opportunity, company: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#description_job' do
      let(:job_opportunity) { build(:job_opportunity, description_job: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#skills' do
      let(:job_opportunity) { build(:job_opportunity, skills: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#salary_range' do
      let(:job_opportunity) { build(:job_opportunity, salary_range: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#deadline' do
      let(:job_opportunity) { build(:job_opportunity, deadline: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#region' do
      let(:job_opportunity) { build(:job_opportunity, region: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
    context '#office_functions' do
      let(:job_opportunity) { build(:job_opportunity, office_functions: '') }
      it 'and can not be valid' do
        expect(job_opportunity).to_not be_valid
      end
    end
  end
end
