class AddDescriptionToIteration < ActiveRecord::Migration
  def change
    add_column :iterations, :description, :text
  end
end
