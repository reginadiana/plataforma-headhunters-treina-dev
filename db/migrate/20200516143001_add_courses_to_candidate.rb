class AddCoursesToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :courses, :string
  end
end
