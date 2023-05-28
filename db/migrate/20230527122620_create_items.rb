class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.text :text
      t.integer :score, default: 0
      t.references :user, null: false , foreign_key: true

      t.timestamps
    end
  end
end
