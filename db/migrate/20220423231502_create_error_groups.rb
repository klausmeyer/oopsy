class CreateErrorGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :error_groups do |t|
      t.references :project, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :error_groups, [:project_id, :name], unique: true
  end
end
