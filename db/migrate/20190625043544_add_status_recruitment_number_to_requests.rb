class AddStatusRecruitmentNumberToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :status, :string
    add_column :requests, :recruitment_number, :integer
  end
end
