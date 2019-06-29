class Comment < ApplicationRecord

    # after_create :create_feed_content
    after_create :create_event_comment

	belongs_to :event
	belongs_to :user
	has_one :feed_content, as: :content, dependent: :destroy
	has_many :event_comments, dependent: :destroy

	private
    # def create_feed_content
    # 	self.feed_content = FeedContent.create(updated_at: updated_at, user_id: user_id)
    # end

    def create_event_comment
    	EventComment.create(user_id: user_id, event_id: event_id, comment_id: id)
    end
end
