class AddFeedbackToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :feedback, :string
  end
end
