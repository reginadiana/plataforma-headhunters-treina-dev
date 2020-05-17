class ApplyJob < ApplicationRecord
	belongs_to :candidate
	belongs_to :job_opportunity

	enum feedback: { accepted: 'Aceito', rejected: 'Rejeitado', hope: 'Em espera' } 
end
