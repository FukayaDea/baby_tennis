class RenameInfoColumnToLikeInfos < ActiveRecord::Migration[5.2]
  def change
  	rename_column :like_infos, :info_id, :tennis_info_id
  end
end
