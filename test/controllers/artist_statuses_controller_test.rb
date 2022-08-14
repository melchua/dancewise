require "test_helper"

class ArtistStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist_status = artist_statuses(:one)
  end

  test "should get index" do
    get artist_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_artist_status_url
    assert_response :success
  end

  test "should create artist_status" do
    assert_difference('ArtistStatus.count') do
      post artist_statuses_url, params: { artist_status: { artist_id: @artist_status.artist_id, status: @artist_status.status } }
    end

    assert_redirected_to artist_status_url(ArtistStatus.last)
  end

  test "should show artist_status" do
    get artist_status_url(@artist_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_artist_status_url(@artist_status)
    assert_response :success
  end

  test "should update artist_status" do
    patch artist_status_url(@artist_status), params: { artist_status: { artist_id: @artist_status.artist_id, status: @artist_status.status } }
    assert_redirected_to artist_status_url(@artist_status)
  end

  test "should destroy artist_status" do
    assert_difference('ArtistStatus.count', -1) do
      delete artist_status_url(@artist_status)
    end

    assert_redirected_to artist_statuses_url
  end
end
