require 'test_helper'

class AudioRecordingTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_recording_track = audio_recording_tracks(:one)
  end

  test "should get index" do
    get audio_recording_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_recording_track_url
    assert_response :success
  end

  test "should create audio_recording_track" do
    assert_difference('AudioRecordingTrack.count') do
      post audio_recording_tracks_url, params: { audio_recording_track: {  } }
    end

    assert_redirected_to audio_recording_track_url(AudioRecordingTrack.last)
  end

  test "should show audio_recording_track" do
    get audio_recording_track_url(@audio_recording_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_recording_track_url(@audio_recording_track)
    assert_response :success
  end

  test "should update audio_recording_track" do
    patch audio_recording_track_url(@audio_recording_track), params: { audio_recording_track: {  } }
    assert_redirected_to audio_recording_track_url(@audio_recording_track)
  end

  test "should destroy audio_recording_track" do
    assert_difference('AudioRecordingTrack.count', -1) do
      delete audio_recording_track_url(@audio_recording_track)
    end

    assert_redirected_to audio_recording_tracks_url
  end
end
