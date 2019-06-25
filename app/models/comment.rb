class Comment < ApplicationRecord

    after_create :create_feed_content

	belongs_to :event
	belongs_to :user
	has_one :feed_content, as: :content, dependent: :destroy

	private
    def create_feed_content
    	self.feed_content = FeedContent.create(updated_at: updated_at)
    end
end
