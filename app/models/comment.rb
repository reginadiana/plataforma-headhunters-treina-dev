class Comment < ApplicationRecord
	belongs_to :candidate
	belongs_to :headhunter

	validates :content, presence: true
end
