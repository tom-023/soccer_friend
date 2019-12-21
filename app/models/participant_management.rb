class ParticipantManagement < ApplicationRecord
  belongs_to :participant, foreign_key: :participant_id, class_name: 'User'
  belongs_to :event
end
