class AudioRecording < ApplicationRecord
    validates :name, presence: true

    belongs_to :session
    has_many :audio_recording_tracks
end
