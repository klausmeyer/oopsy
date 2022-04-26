class AddIndexToErrorUnity < ActiveRecord::Migration[7.0]
  def change
    add_index :error_unities, [:error_type, :error_message]
  end
end
