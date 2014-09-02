class AddIdeaToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :idea_id, :integer
    add_index :iterations, :idea_id
  end
end
