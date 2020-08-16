class MoveAudioFileFromSessionToTrack < ActiveRecord::Migration[6.0]
  def change
    Session.find_each do |session|
      next unless session.audio_files
      session.audio_files.all.each do |audio_file|
        recording = AudioRecording.create(name: audio_file.filename, date: session.date, session: session)
        track = AudioRecordingTrack.create(name: '1', file_url: recording.file_url, audio_recording: recording)
        track.audio_file.attach(audio_file.blob)
      end
    end
  end
end
