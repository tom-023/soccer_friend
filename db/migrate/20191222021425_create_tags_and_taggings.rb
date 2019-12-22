class CreateTagsAndTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title

      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :event_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
