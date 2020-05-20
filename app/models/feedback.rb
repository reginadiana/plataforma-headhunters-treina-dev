class Feedback < ApplicationRecord
	belongs_to :apply_job
	belongs_to :choice

	validates :message, length: { maximum: 500 }
end
