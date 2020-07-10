json.extract! session, :id, :text_log, :date, :created_at, :updated_at
json.url session_url(session, format: :json)
