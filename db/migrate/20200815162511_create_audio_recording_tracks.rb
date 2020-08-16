class CreateAudioRecordingTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :audio_recording_tracks do |t|
      t.string :name
      t.string :file_url

      t.timestamps
    end
  end
end
