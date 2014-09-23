class AddFeedbackToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :feedback, :text
  end
end
