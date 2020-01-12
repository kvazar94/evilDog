# frozen_string_literal: true

class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :birthday, :date
  end
end
