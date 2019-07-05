class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_events, through: :comments, source: :event, dependent: :destroy
  
  # グループテーブル　リレーション
  has_many :event_groups, through: :events, source: :group, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :like_events, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :tennis_infos, dependent: :destroy

  has_one_attached :image, dependent: :destroy

  validates :nickname, :over20, presence: true
end
