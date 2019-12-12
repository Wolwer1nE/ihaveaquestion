class AddMessages < ActiveRecord::Migration[6.0]
  def up
    create_table :messages do |t|
      t.body
      t.references :user
      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
