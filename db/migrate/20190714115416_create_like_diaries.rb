class CreateLikeDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :like_diaries do |t|
      t.integer :user_id
      t.integer :diary_id
      t.timestamps
    end
  end
end
