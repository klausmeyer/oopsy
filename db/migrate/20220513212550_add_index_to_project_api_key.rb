class AddIndexToProjectApiKey < ActiveRecord::Migration[7.0]
  def change
    add_index :projects, :api_key, unique: true
  end
end
