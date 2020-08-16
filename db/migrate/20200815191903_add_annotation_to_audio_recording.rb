class AddAnnotationToAudioRecording < ActiveRecord::Migration[6.0]
  def change
    add_column :audio_recordings, :annotation, :string
  end
end
