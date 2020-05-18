class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.string :message
      t.references :job_opportunity, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
