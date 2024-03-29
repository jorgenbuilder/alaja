class Session < ApplicationRecord
    validates :date, presence: true
    validates :audio_files, presence: true

    has_many_attached :audio_files

    has_many :audio_recordings
end
