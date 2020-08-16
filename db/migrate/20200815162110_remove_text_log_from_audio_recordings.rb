class RemoveTextLogFromAudioRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :audio_recordings, :text_log, :string
  end
end
