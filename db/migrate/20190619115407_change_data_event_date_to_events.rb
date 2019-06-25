class ChangeDataEventDateToEvents < ActiveRecord::Migration[5.2]
  def change
  	change_column :events, :event_date, :date
  	change_column :events, :meeting_time, :time
  end
end