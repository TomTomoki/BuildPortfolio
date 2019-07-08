class RemoveRequestOpenColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :status
  end
end
