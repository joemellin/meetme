class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.string :title

      t.timestamps
    end
  end
end
