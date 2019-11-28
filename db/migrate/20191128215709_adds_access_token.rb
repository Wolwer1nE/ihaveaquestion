class AddsAccessToken < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :github_token, :string
    add_column :users, :avatar_url, :string
  end

  def  down
    remove_column :users, :github_token
    remove_column :users, :avatar_url

  end
end
