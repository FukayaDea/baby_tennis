class LikeInfo < ApplicationRecord
	belongs_to :user
	belongs_to :tennis_info
	validates_uniqueness_of :tennis_info_id, scope: :user_id
end
