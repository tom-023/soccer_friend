class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :events, foreign_key: :organizer_id, dependent: :destroy
  has_many :participant_managements, foreign_key: :participant_id, dependent: :destroy
end
