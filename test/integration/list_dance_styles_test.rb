require "test_helper"

class ListDanceStylesTest < ActionDispatch::IntegrationTest
  def setup
    @dance_style = DanceStyle.create(name: "Kizomba")
    @dance_style2 = DanceStyle.create(name: "Salsa")
  end

  test "should show dance styles listing" do
    get '/dance_styles'
    assert_select "a[href=?]", dance_style_path(@dance_style), text: @dance_style.name
    assert_select "a[href=?]", dance_style_path(@dance_style2), text: @dance_style2.name
  end
end
