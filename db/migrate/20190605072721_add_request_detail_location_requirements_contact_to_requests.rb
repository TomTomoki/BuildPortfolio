class AddRequestDetailLocationRequirementsContactToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :request_detail, :text
    add_column :requests, :location, :string
    add_column :requests, :requirements, :text
    add_column :requests, :contact, :string
  end
end
