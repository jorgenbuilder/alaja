class AddSessionIdToAudioRecording < ActiveRecord::Migration[6.0]
  def change
    add_column :audio_recordings, :session_id, :integer
  end
end
