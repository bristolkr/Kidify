class ModifyPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :body, :text
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
