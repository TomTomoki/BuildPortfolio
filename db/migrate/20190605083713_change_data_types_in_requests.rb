class ChangeDataTypesInRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :date
    add_column :requests, :startDateTime, :timestamp

    remove_column :requests, :time
    add_column :requests, :endDateTime, :timestamp
  end
end
