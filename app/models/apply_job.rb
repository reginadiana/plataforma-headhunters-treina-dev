class ApplyJob < ApplicationRecord
  belongs_to :candidate
  belongs_to :job_opportunity

  validates :message, presence: true
  validates :message, length: { maximum: 500 }

  enum feedback: { accepted: 'Aceito', rejected: 'Rejeitado', hope: 'Em espera' }
end
