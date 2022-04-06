# frozen_string_literal: true

require 'application_system_test_case'

class EventFrequenciesTest < ApplicationSystemTestCase
  setup do
    @event_frequency = event_frequencies(:one)
  end

  test 'visiting the index' do
    visit event_frequencies_url
    assert_selector 'h1', text: 'Event Frequencies'
  end

  test 'creating a Event frequency' do
    visit event_frequencies_url
    click_on 'New Event Frequency'

    fill_in 'Event', with: @event_frequency.event_id
    fill_in 'Name', with: @event_frequency.name
    click_on 'Create Event frequency'

    assert_text 'Event frequency was successfully created'
    click_on 'Back'
  end

  test 'updating a Event frequency' do
    visit event_frequencies_url
    click_on 'Edit', match: :first

    fill_in 'Event', with: @event_frequency.event_id
    fill_in 'Name', with: @event_frequency.name
    click_on 'Update Event frequency'

    assert_text 'Event frequency was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Event frequency' do
    visit event_frequencies_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Event frequency was successfully destroyed'
  end
end
