class CreateAwnserProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :awnser_proposals do |t|
      t.references :choice, null: false, foreign_key: true
      t.string :awnser_message
      t.references :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
