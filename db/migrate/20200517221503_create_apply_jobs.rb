# frozen_string_literal: true

class CreateApplyJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :apply_jobs do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :job_opportunity, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
