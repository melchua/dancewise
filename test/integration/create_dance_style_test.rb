# frozen_string_literal: true

require 'test_helper'

class CreateDanceStyleTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: 'johndoe', email: 'johndoe@example.com',
                              password: 'password', admin: true)
    sign_in_as(@admin_user)
  end

  test 'get new dance style form and create dance style' do
    get '/dance_styles/new'
    assert_response :success
    assert_difference 'DanceStyle.count', 1 do
      post dance_styles_path, params: { dance_style: { name: 'Kizomba' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Kizomba', response.body
  end

  test 'get new dance style form and reject invalid dance style submission' do
    get '/dance_styles/new'
    assert_response :success
    assert_no_difference 'DanceStyle.count' do
      post dance_styles_path, params: { dance_style: { name: ' ' } }
    end
    assert_select 'div.alert'
    assert_match 'errors', response.body
  end
end
