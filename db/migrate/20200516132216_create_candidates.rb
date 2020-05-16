class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :full_name
      t.string :social_name
      t.date :date_of_birth
      t.string :profile_description
      t.string :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
