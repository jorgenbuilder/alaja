class RemoveDateFromAudioRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :audio_recordings, :date, :datetime
  end
end
