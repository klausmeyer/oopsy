class CreateErrorOccurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :error_occurrences do |t|
      t.references :notice, null: false, foreign_key: true
      t.string :error_type
      t.string :error_message
      t.json :backtrace

      t.timestamps
    end
  end
end
