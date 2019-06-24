class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :applicant, foreign_key: { to_table: :users }
      t.references :request, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
