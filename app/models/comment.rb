class Comment < ApplicationRecord
	belongs_to :candidate
	belongs_to :headhunter

	validates :content, presence: true
	validates :content, length: { maximum: 500 }
end
