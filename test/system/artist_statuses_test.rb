require "application_system_test_case"

class ArtistStatusesTest < ApplicationSystemTestCase
  setup do
    @artist_status = artist_statuses(:one)
  end

  test "visiting the index" do
    visit artist_statuses_url
    assert_selector "h1", text: "Artist Statuses"
  end

  test "creating a Artist status" do
    visit artist_statuses_url
    click_on "New Artist Status"

    fill_in "Artist", with: @artist_status.artist_id
    fill_in "Status", with: @artist_status.status
    click_on "Create Artist status"

    assert_text "Artist status was successfully created"
    click_on "Back"
  end

  test "updating a Artist status" do
    visit artist_statuses_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @artist_status.artist_id
    fill_in "Status", with: @artist_status.status
    click_on "Update Artist status"

    assert_text "Artist status was successfully updated"
    click_on "Back"
  end

  test "destroying a Artist status" do
    visit artist_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artist status was successfully destroyed"
  end
end
