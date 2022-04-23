class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.references :project, null: false
      t.json :context
      t.json :environment
      t.json :session
      t.json :params
      t.json :raw, null: false

      t.timestamps
    end
  end
end
