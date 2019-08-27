class AddAgreeToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :agree, :integer
  end
end
