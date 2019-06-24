class RenameApplicationToRequestApplication < ActiveRecord::Migration[5.2]
  def change
    rename_table :applications, :request_applications
  end
end
