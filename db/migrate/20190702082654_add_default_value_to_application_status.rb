class AddDefaultValueToApplicationStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :request_applications, :status, :string, :default => "applied"
  end
end
