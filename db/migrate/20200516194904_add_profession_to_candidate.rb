class AddProfessionToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :profession, :string
  end
end
