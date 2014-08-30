class AddAboutToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :about, :text
  end
end
