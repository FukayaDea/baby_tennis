class TennisInfo < ApplicationRecord
	belongs_to :user
	has_many :like_infos, dependent: :destroy
	has_many :liked_users, through: :like_infos, source: :user
end
