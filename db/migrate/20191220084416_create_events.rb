class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: ""
      t.datetime :day, null: false, default: ""
      t.string :place, null: false, default: ""
      t.text :content, null: false, default: ""
      t.string :cheering_team, null: false, default: ""
      t.integer :organizer_id, null: false

      t.timestamps
    end
  end
end
