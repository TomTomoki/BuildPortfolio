class AddRequestBooleanOpenColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :open, :boolean, :default => true
  end
end
