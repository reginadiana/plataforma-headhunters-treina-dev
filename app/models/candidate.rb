class Candidate < ApplicationRecord
	belongs_to :user
	belongs_to :level
	has_one_attached :avatar	
end
