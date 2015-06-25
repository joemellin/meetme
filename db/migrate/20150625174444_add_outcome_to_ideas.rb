class AddOutcomeToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :outcome, :string
  end
end
