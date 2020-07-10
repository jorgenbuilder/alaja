require 'test_helper'

class AudioRecordingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_recording = audio_recordings(:one)
  end

  test "should get index" do
    get audio_recordings_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_recording_url
    assert_response :success
  end

  test "should create audio_recording" do
    assert_difference('AudioRecording.count') do
      post audio_recordings_url, params: { audio_recording: { date: @audio_recording.date, file_url: @audio_recording.file_url, name: @audio_recording.name, text_log: @audio_recording.text_log } }
    end

    assert_redirected_to audio_recording_url(AudioRecording.last)
  end

  test "should show audio_recording" do
    get audio_recording_url(@audio_recording)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_recording_url(@audio_recording)
    assert_response :success
  end

  test "should update audio_recording" do
    patch audio_recording_url(@audio_recording), params: { audio_recording: { date: @audio_recording.date, file_url: @audio_recording.file_url, name: @audio_recording.name, text_log: @audio_recording.text_log } }
    assert_redirected_to audio_recording_url(@audio_recording)
  end

  test "should destroy audio_recording" do
    assert_difference('AudioRecording.count', -1) do
      delete audio_recording_url(@audio_recording)
    end

    assert_redirected_to audio_recordings_url
  end
end
