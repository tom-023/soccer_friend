class AddForeignKeyParticipantManagements < ActiveRecord::Migration[5.2]
  def change
    add_index :participant_managements, :event_id
    add_index :participant_managements, :participant_id
  end
  add_foreign_key :participant_managements, :users, column: :participant_id
end
