class CreateLikeEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :like_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end
end
