json.extract! audio_recording, :id, :date, :name, :text_log, :file_url, :created_at, :updated_at
json.url audio_recording_url(audio_recording, format: :json)
