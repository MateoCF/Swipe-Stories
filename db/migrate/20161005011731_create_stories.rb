class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :story
      t.boolean :quote
      t.string :author

      t.timestamps null: false
    end
  end
end
