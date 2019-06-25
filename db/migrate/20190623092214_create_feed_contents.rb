class CreateFeedContents < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_contents do |t|
      t.integer :content_id
      t.string  :content_type
      t.timestamps
    end
  end
end
