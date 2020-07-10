require "application_system_test_case"

class AudioRecordingsTest < ApplicationSystemTestCase
  setup do
    @audio_recording = audio_recordings(:one)
  end

  test "visiting the index" do
    visit audio_recordings_url
    assert_selector "h1", text: "Audio Recordings"
  end

  test "creating a Audio recording" do
    visit audio_recordings_url
    click_on "New Audio Recording"

    fill_in "Date", with: @audio_recording.date
    fill_in "File url", with: @audio_recording.file_url
    fill_in "Name", with: @audio_recording.name
    fill_in "Text log", with: @audio_recording.text_log
    click_on "Create Audio recording"

    assert_text "Audio recording was successfully created"
    click_on "Back"
  end

  test "updating a Audio recording" do
    visit audio_recordings_url
    click_on "Edit", match: :first

    fill_in "Date", with: @audio_recording.date
    fill_in "File url", with: @audio_recording.file_url
    fill_in "Name", with: @audio_recording.name
    fill_in "Text log", with: @audio_recording.text_log
    click_on "Update Audio recording"

    assert_text "Audio recording was successfully updated"
    click_on "Back"
  end

  test "destroying a Audio recording" do
    visit audio_recordings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Audio recording was successfully destroyed"
  end
end
