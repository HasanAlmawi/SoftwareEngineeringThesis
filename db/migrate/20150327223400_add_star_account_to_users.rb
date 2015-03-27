class AddStarAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :star_username, :string
  end
end
