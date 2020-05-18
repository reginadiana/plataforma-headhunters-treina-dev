class ApplyJob < ApplicationRecord
	belongs_to :candidate
	belongs_to :job_opportunity

	enum feedback: { accepted: 'Aceito', rejected: 'Rejeitado', hope: 'Em espera' }

	validates :message, presence: true
	validates :message, length: { maximum: 500 }
end
