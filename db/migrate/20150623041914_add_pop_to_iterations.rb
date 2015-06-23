class AddPopToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :pop, :string
  end
end
