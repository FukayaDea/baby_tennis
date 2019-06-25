class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :career, :string
  	add_column :users, :play_erea, :string
  end
end
