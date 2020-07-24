# frozen_string_literal: true

class AddJobOpportunityToInterview < ActiveRecord::Migration[6.0]
  def change
    add_reference :interviews, :job_opportunity, null: false, foreign_key: true
  end
end
