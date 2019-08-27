class Diary < ApplicationRecord

	belongs_to :user
	has_one_attached :image, dependent: :destroy
	has_many :like_diaries, dependent: :destroy
	has_many :liked_users, through: :like_diaries, source: :user

end
