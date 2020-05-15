class JobOpportunity < ApplicationRecord
	belongs_to :level
	belongs_to :headhunter

	validates :title, :company, :description_job, :skills, :salary_range, :deadline, :office_functions, presence: true
	validates :title, uniqueness: true
	validates :salary_range , :numericality => { greater_than: 1045}
	validates :deadline, :numericality => { greater_than: Date.today }

	validate :deadline_date_cannot_be_in_the_past

	def deadline_date_cannot_be_in_the_past
		if deadline_date.present? && deadline_date < Date.today
			errors.add(:deadline, "não pode estar no passado")
		end
	end
end
