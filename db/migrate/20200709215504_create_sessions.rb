class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :text_log
      t.date :date

      t.timestamps
    end
  end
end
