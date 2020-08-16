class RemoveFileUrlFromAudioRecordingTracks < ActiveRecord::Migration[6.0]
  def change
    remove_column :audio_recording_tracks, :file_url, :string
  end
end
