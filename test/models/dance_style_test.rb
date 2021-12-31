require 'test_helper'

class DanceStyleTest < ActiveSupport::TestCase

  def setup
    @dance_style = DanceStyle.new(name: "Kizomba")
  end

  test "dance style should be valid" do
    assert @dance_style.valid?
  end

  test 'name should be present' do
    @dance_style.name = ""
    assert_not @dance_style.valid?
  end

  test 'name should be unique' do
    @dance_style.save
    @dance_style2 = DanceStyle.new(name: "Kizomba")
    assert_not @dance_style2.valid?
  end

  test 'name should not be too long' do
    @dance_style.name = "a" * 26
    assert_not @dance_style.valid?
  end

  test 'name should not be too short' do
    @dance_style.name = "aa"
    assert_not @dance_style.valid?
  end
end
