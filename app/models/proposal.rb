class Proposal < ApplicationRecord
	belongs_to :job_opportunity
	belongs_to :candidate

	enum state: { accepted: 'Aceito', rejected: 'Rejeitado', hope: 'Em espera' } 
end
