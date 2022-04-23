class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.json :raw

      t.timestamps
    end
  end
end
