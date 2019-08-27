class CreateTennisInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :tennis_infos do |t|
      t.integer :user_id
      t.text :text
      t.timestamps
    end
  end
end
