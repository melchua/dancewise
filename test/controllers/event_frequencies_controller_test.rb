require "test_helper"

class EventFrequenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_frequency = event_frequencies(:one)
  end

  test "should get index" do
    get event_frequencies_url
    assert_response :success
  end

  test "should get new" do
    get new_event_frequency_url
    assert_response :success
  end

  test "should create event_frequency" do
    assert_difference('EventFrequency.count') do
      post event_frequencies_url, params: { event_frequency: { event_id: @event_frequency.event_id, name: @event_frequency.name } }
    end

    assert_redirected_to event_frequency_url(EventFrequency.last)
  end

  test "should show event_frequency" do
    get event_frequency_url(@event_frequency)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_frequency_url(@event_frequency)
    assert_response :success
  end

  test "should update event_frequency" do
    patch event_frequency_url(@event_frequency), params: { event_frequency: { event_id: @event_frequency.event_id, name: @event_frequency.name } }
    assert_redirected_to event_frequency_url(@event_frequency)
  end

  test "should destroy event_frequency" do
    assert_difference('EventFrequency.count', -1) do
      delete event_frequency_url(@event_frequency)
    end

    assert_redirected_to event_frequencies_url
  end
end
