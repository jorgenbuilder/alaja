class AudioRecordingTrack < ApplicationRecord
    belongs_to :audio_recording
    has_one_attached :audio_file
end
