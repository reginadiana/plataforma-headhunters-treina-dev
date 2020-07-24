# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.date :interview_date
      t.time :hour
      t.string :address

      t.timestamps
    end
  end
end
