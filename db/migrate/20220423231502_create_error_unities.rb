class CreateErrorUnities < ActiveRecord::Migration[7.0]
  def change
    create_table :error_unities do |t|
      t.references :project, null: false
      t.string :error_type
      t.string :error_message

      t.timestamps
    end
  end
end
