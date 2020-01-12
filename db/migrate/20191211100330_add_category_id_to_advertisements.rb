# frozen_string_literal: true

class AddCategoryIdToAdvertisements < ActiveRecord::Migration[6.0]
  def change
    add_column :advertisements, :category_id, :integer
    add_index :advertisements, :category_id
  end
end
