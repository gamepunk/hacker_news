class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :item, null: false , foreign_key: true
      t.references :parent_comment
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
