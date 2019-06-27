class AddUserIdToFeedContents < ActiveRecord::Migration[5.2]
  def change
    add_column :feed_contents, :user_id, :integer
  end
end
