class AddHeadhunterToJobOpportunity < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_opportunities, :headhunter, null: false, foreign_key: true
  end
end
