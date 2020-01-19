class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: :organizer_id
  has_many :participant_managements, dependent: :destroy
  has_many :participant_users, through: :participant_managements, source: :participant
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, allow_destroy: true

  validates :title, presence: true, length: { maximum: 30 }
  validates :place, presence: true
  validates :day,  presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :cheering_team, presence: true

  scope :ranking, -> { find(ParticipantManagement.group(:event_id).order('count(event_id) desc').limit(3).pluck(:event_id)) }
  scope :tagjoin, -> (count){ joins(:tags).where(tags: {id:(count)}) }
  scope :team_search, -> (team){ where('cheering_team LIKE ?', "#{team}") }
  scope :display, -> (number){ page(number).per(4).order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[day]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
