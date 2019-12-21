class CreateParticipantManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_managements do |t|
      t.integer :event_id, null: false
      t.integer :participant_id, null: false

      t.timestamps
    end
  end
end
