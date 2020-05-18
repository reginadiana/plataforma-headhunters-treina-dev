class Feedback < ApplicationRecord
	belongs_to :apply_job
	belongs_to :choice
end
