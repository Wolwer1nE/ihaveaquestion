class InitialMigration < ActiveRecord::Migration[6.0]
  def up
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.string :type

      t.timestamps
    end

    create_table :users do |t|
      t.string :login
      t.string :password

      t.timestamps
    end

    create_table :comments do |t|
      t.string :text

      t.timestamps
    end

  end

  def down
    drop_table :posts
    drop_table :users
    drop_table :comments
  end
end
