class AddUserRefToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
