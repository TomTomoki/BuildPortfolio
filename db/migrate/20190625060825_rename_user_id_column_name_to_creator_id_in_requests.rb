class RenameUserIdColumnNameToCreatorIdInRequests < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :user_id, :creator_id
  end
end
