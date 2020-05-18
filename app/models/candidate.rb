class Candidate < ApplicationRecord
	belongs_to :level
	belongs_to :user
	has_one_attached :avatar
	
	enum feedback: { featured: 0, not_highlighted: 1 } 

	validates :full_name, 
		  :social_name,
		  :date_of_birth,
		  :profession,
		  :profile_description,
		  :formation, presence: true

	validates :profile_description, length: { maximum: 2000 }

	validate :date_of_birth_cannot_be_in_future

	def date_of_birth_cannot_be_in_future
		if date_of_birth.present? && date_of_birth > Date.today
			errors.add(:date_of_birth, "não pode estar no futuro")
		end
	end
end
