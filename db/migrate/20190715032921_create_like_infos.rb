class CreateLikeInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :like_infos do |t|
      t.integer :user_id
      t.integer :info_id
      t.timestamps
    end
  end
end
