require "application_system_test_case"

class AudioRecordingTracksTest < ApplicationSystemTestCase
  setup do
    @audio_recording_track = audio_recording_tracks(:one)
  end

  test "visiting the index" do
    visit audio_recording_tracks_url
    assert_selector "h1", text: "Audio Recording Tracks"
  end

  test "creating a Audio recording track" do
    visit audio_recording_tracks_url
    click_on "New Audio Recording Track"

    click_on "Create Audio recording track"

    assert_text "Audio recording track was successfully created"
    click_on "Back"
  end

  test "updating a Audio recording track" do
    visit audio_recording_tracks_url
    click_on "Edit", match: :first

    click_on "Update Audio recording track"

    assert_text "Audio recording track was successfully updated"
    click_on "Back"
  end

  test "destroying a Audio recording track" do
    visit audio_recording_tracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Audio recording track was successfully destroyed"
  end
end
