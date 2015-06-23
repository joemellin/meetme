class AddPopwordToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :popword, :string
  end
end
