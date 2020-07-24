# frozen_string_literal: true

class AwnserProposal < ApplicationRecord
  belongs_to :choice
  belongs_to :proposal

  validates :awnser_message, length: { maximum: 500 }
end
