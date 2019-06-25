class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments, ->{ order("created_at DESC") }
  has_many :commented_events, through: :comments, source: :event
  
  # グループテーブル　リレーション
  has_many :event_groups, through: :events, source: :group


  has_one_attached :image

  validates :nickname, presence: true
end
