class FeedContent < ApplicationRecord
	belongs_to :content, polymorphic: true

end
# 作ったけど使ってない