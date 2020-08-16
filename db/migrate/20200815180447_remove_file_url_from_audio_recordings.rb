class RemoveFileUrlFromAudioRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :audio_recordings, :file_url, :string
  end
end
