# frozen_string_literal: true

class Level < ApplicationRecord
  validates :name, presence: true
end
