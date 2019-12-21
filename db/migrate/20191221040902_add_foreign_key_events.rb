class AddForeignKeyEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :organizer_id
  end
  add_foreign_key :events, :users, column: :organizer_id
end
