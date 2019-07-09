class AddRewardToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :reward, :string
  end
end
