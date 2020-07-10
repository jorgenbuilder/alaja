class CreateAudioRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :audio_recordings do |t|
      t.datetime :date
      t.string :name
      t.string :text_log
      t.string :file_url

      t.timestamps
    end
  end
end
