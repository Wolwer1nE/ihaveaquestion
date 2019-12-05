class RenameSubscribeToSubscribtion < ActiveRecord::Migration[6.0]
  def change
    rename_table :subscribes, :subscriptions
  end
end
