# frozen_string_literal: true

class CreateJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_opportunities do |t|
      t.string :title
      t.string :company
      t.string :description_job
      t.string :skills
      t.decimal :salary_range
      t.references :level, null: false, foreign_key: true
      t.date :deadline
      t.string :region
      t.string :benefits
      t.string :office_functions
      t.string :company_expectations

      t.timestamps
    end
  end
end
