class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :caption
      t.string :image
      t.string :document

      t.timestamps null: false
    end
  end
end
