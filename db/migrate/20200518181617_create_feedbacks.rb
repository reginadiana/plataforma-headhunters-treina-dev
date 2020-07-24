# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :message
      t.references :apply_job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
