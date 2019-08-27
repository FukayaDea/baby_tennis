class AddOver20ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :over20, :integer
  end
end
