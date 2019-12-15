class AddUserIdToAdvertisements < ActiveRecord::Migration[6.0]
  def change
    add_column :advertisements, :user_id, :integer
  end
end
