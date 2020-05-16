class Candidate < ApplicationRecord
	belongs_to :level
	belongs_to :user
	has_one_attached :avatar

	validates :full_name, 
		  :social_name,
		  :date_of_birth,
		  :profession,
		  :profile_description,
		  :formation, presence: true

	validate :date_of_birth_cannot_be_in_future

	def date_of_birth_cannot_be_in_future
		if date_of_birth.present? && date_of_birth > Date.today
			errors.add(:date_of_birth, "não pode estar no futuro")
		end
	end
end
