class AddAudioRecordingIdToAudioRecordingTrack < ActiveRecord::Migration[6.0]
  def change
    add_column :audio_recording_tracks, :audio_recording_id, :integer
  end
end
