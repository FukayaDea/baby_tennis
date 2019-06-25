class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :event_id
      t.integer :user_id
      t.timestamps
    end
  end
end
