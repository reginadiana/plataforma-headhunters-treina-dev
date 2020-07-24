# frozen_string_literal: true

class Proposal < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate

  enum status: { accepted: 'Aceito', rejected: 'Rejeitado', hope: 'Em espera' }
end
