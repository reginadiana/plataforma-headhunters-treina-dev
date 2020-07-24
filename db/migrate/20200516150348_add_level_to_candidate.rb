# frozen_string_literal: true

class AddLevelToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_reference :candidates, :level, foreign_key: true
  end
end
