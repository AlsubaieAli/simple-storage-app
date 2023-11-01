require "test_helper"

class AppConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_config = app_configs(:one)
  end

  test "should get index" do
    get app_configs_url, as: :json
    assert_response :success
  end

  test "should create app_config" do
    assert_difference("AppConfig.count") do
      post app_configs_url, params: { app_config: { storage_option_id: @app_config.storage_option_id } }, as: :json
    end

    assert_response :created
  end

  test "should show app_config" do
    get app_config_url(@app_config), as: :json
    assert_response :success
  end

  test "should update app_config" do
    patch app_config_url(@app_config), params: { app_config: { storage_option_id: @app_config.storage_option_id } }, as: :json
    assert_response :success
  end

  test "should destroy app_config" do
    assert_difference("AppConfig.count", -1) do
      delete app_config_url(@app_config), as: :json
    end

    assert_response :no_content
  end
end
