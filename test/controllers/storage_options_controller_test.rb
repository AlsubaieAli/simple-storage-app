require "test_helper"

class StorageOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_option = storage_options(:one)
  end

  test "should get index" do
    get storage_options_url, as: :json
    assert_response :success
  end

  test "should create storage_option" do
    assert_difference("StorageOption.count") do
      post storage_options_url, params: { storage_option: { name: @storage_option.name } }, as: :json
    end

    assert_response :created
  end

  test "should show storage_option" do
    get storage_option_url(@storage_option), as: :json
    assert_response :success
  end

  test "should update storage_option" do
    patch storage_option_url(@storage_option), params: { storage_option: { name: @storage_option.name } }, as: :json
    assert_response :success
  end

  test "should destroy storage_option" do
    assert_difference("StorageOption.count", -1) do
      delete storage_option_url(@storage_option), as: :json
    end

    assert_response :no_content
  end
end
