# frozen_string_literal: true

require 'test_helper'

class DanceStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dance_style = DanceStyle.create(name: 'Kizomba')
    @admin_user = User.create(username: 'johndo', email: 'johndoe@example.com',
                              password: 'password', admin: true)
  end

  test 'should get index' do
    get dance_styles_url
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@admin_user)
    get new_dance_style_url
    assert_response :success
  end

  test 'should create dance_style' do
    sign_in_as(@admin_user)
    assert_difference('DanceStyle.count', 1) do
      post dance_styles_url, params: { dance_style: { name: 'Salsa' } }
    end
    assert_redirected_to dance_style_url(DanceStyle.last)
  end

  test 'should not create dance_style' do
    assert_no_difference('DanceStyle.count') do
      post dance_styles_url, params: { dance_style: { name: 'Salsa' } }
    end

    assert_redirected_to dance_styles_url
  end

  test 'should show dance_style' do
    get dance_style_url(@dance_style)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_dance_style_url(@dance_style)
  #   assert_response :success
  # end

  # test "should update dance_style" do
  #   patch dance_style_url(@dance_style), params: { dance_style: {  } }
  #   assert_redirected_to dance_style_url(@dance_style)
  # end

  # test "should destroy dance_style" do
  #   assert_difference('DanceStyle.count', -1) do
  #     delete dance_style_url(@dance_style)
  #   end

  #   assert_redirected_to dance_styles_url
  # end
end
