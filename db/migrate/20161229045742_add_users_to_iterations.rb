class AddUsersToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :userid, :integer
  end
end
