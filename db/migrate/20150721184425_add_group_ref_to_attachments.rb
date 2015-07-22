class AddGroupRefToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :group, index: true, foreign_key: true
  end
end
