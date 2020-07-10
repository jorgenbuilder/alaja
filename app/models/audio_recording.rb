class AudioRecording < ApplicationRecord
    validates :date, presence: true
    validates :name, presence: true

    validates :audio_files, presence: true

    has_many_attached :audio_files
end
