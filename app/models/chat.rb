class Chat < ApplicationRecord
  belongs_to :user
  has_many :like_chats, dependent: :destroy
  has_many :liked_users, through: :like_chats, source: :user
end
