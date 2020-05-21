class AddCandidateToInterview < ActiveRecord::Migration[6.0]
  def change
    add_reference :interviews, :candidate, null: false, foreign_key: true
  end
end
