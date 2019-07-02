class AddDefaultValueToRequestStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :status, :string, :default => "open"
  end
end
