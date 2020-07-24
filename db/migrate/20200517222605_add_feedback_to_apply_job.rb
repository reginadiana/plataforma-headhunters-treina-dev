# frozen_string_literal: true

class AddFeedbackToApplyJob < ActiveRecord::Migration[6.0]
  def change
    add_column :apply_jobs, :feedback, :string
  end
end
