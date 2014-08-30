class AddFburlToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fburl, :string
  end
end
