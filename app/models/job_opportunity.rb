class JobOpportunity < ApplicationRecord
	belongs_to :level
	belongs_to :headhunter

	scope :search, ->(query) { where('title LIKE ?', "%#{query}%")
                              .or( where('skills LIKE ?', "%#{query}%") ) }

	validates :title, 
		:company,
		:description_job,
		:skills,
		:salary_range,
		:deadline,
		:region,
		:office_functions, presence: true

	validates :title, uniqueness: true
	validates :salary_range , :numericality => { greater_than: 1045 }
	validates :description_job, :office_functions, :benefits, :company_expectations, length: { maximum: 4000 }

	validate :deadline_cannot_be_in_the_past

	def deadline_cannot_be_in_the_past
		if deadline.present? && deadline < Date.today
			errors.add(:deadline, "não pode estar no passado")
		end
	end
end
