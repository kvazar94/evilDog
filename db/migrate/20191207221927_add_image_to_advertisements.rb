class AddImageToAdvertisements < ActiveRecord::Migration[6.0]
  def change
    add_column :advertisements, :image, :string
  end
end
