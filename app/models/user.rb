class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :events, foreign_key: :organizer_id, dependent: :destroy
  has_many :participant_managements, foreign_key: :participant_id, dependent: :destroy

  mount_uploader :icon, ImageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :introduce, length: { maximum: 150 }
  validates :password, presence: true, length: { minimum: 6 }
end
