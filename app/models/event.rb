class Event < ApplicationRecord

	# after_create :create_feed_content
	after_create :create_group

	validates :event_date, :prefecture,:meeting_place, :meeting_time, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one :feed_content, as: :content, dependent: :destroy
     # グループテーブル リレーション
    has_many :groups, dependent: :destroy
    has_many :event_comments, dependent: :destroy
    has_many :like_events, dependent: :destroy

    def user_comment(user_id)
    	Comment.find_by(user_id: user_id, event_id: id)
    end

    private
    # def create_feed_content
    # 	self.feed_content = FeedContent.create(updated_at: updated_at, user_id: user_id)
    # end

    def create_group
    	Group.create(event_id: id, user_id: user.id )
    end
end
