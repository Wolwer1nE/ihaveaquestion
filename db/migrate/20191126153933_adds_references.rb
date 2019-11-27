class AddsReferences < ActiveRecord::Migration[6.0]
  def up
    create_table :likes do |t|
      t.references :user
      t.references :post
    end


    add_column :posts, :question_id, :integer
    add_column :posts, :user_id, :integer

    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string

  end

  def down
    drop_table :likes

   remove_column :posts, :question_id
   remove_column :posts, :user_id

   remove_column :comments, :commentable_id
   remove_column :comments, :commentable_type
  end
end
