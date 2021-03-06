class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.string :uuid
      t.references :project, null: false
      t.string :state, null: false, default: Notice.aasm.initial_state
      t.json :context
      t.json :environment
      t.json :session
      t.json :params
      t.json :raw, null: false

      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
