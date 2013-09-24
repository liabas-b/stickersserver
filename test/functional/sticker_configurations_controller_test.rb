require 'test_helper'

class StickerConfigurationsControllerTest < ActionController::TestCase
  setup do
    @sticker_configuration = sticker_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sticker_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sticker_configuration" do
    assert_difference('StickerConfiguration.count') do
      post :create, sticker_configuration: { activate: @sticker_configuration.activate, frequency_update: @sticker_configuration.frequency_update, sticker_code: @sticker_configuration.sticker_code }
    end

    assert_redirected_to sticker_configuration_path(assigns(:sticker_configuration))
  end

  test "should show sticker_configuration" do
    get :show, id: @sticker_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sticker_configuration
    assert_response :success
  end

  test "should update sticker_configuration" do
    put :update, id: @sticker_configuration, sticker_configuration: { activate: @sticker_configuration.activate, frequency_update: @sticker_configuration.frequency_update, sticker_code: @sticker_configuration.sticker_code }
    assert_redirected_to sticker_configuration_path(assigns(:sticker_configuration))
  end

  test "should destroy sticker_configuration" do
    assert_difference('StickerConfiguration.count', -1) do
      delete :destroy, id: @sticker_configuration
    end

    assert_redirected_to sticker_configurations_path
  end
end
