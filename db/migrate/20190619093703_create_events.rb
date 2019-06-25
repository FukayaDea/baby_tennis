class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :event_date
      t.string :prefecture
      t.string :court
      t.text :court_url
      t.text :meeting_place
      t.integer :meeting_time
      t.text :access
      t.integer :budget
      t.integer :max_member
      t.integer :joining
      t.integer :racket
      t.text :remarks
      t.integer :cancel
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
