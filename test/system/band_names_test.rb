require "application_system_test_case"

class BandNamesTest < ApplicationSystemTestCase
  setup do
    @band_name = band_names(:one)
  end

  test "visiting the index" do
    visit band_names_url
    assert_selector "h1", text: "Band Names"
  end

  test "creating a Band name" do
    visit band_names_url
    click_on "New Band Name"

    fill_in "Date", with: @band_name.date
    fill_in "Name", with: @band_name.name
    click_on "Create Band name"

    assert_text "Band name was successfully created"
    click_on "Back"
  end

  test "updating a Band name" do
    visit band_names_url
    click_on "Edit", match: :first

    fill_in "Date", with: @band_name.date
    fill_in "Name", with: @band_name.name
    click_on "Update Band name"

    assert_text "Band name was successfully updated"
    click_on "Back"
  end

  test "destroying a Band name" do
    visit band_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Band name was successfully destroyed"
  end
end
