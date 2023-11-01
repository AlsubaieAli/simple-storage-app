require "test_helper"

class StorageRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_record = storage_records(:one)
  end

  test "should get index" do
    get storage_records_url, as: :json
    assert_response :success
  end

  test "should create storage_record" do
    assert_difference("StorageRecord.count") do
      post storage_records_url, params: { storage_record: { storable_id: @storage_record.storable_id, storable_type: @storage_record.storable_type } }, as: :json
    end

    assert_response :created
  end

  test "should show storage_record" do
    get storage_record_url(@storage_record), as: :json
    assert_response :success
  end

  test "should update storage_record" do
    patch storage_record_url(@storage_record), params: { storage_record: { storable_id: @storage_record.storable_id, storable_type: @storage_record.storable_type } }, as: :json
    assert_response :success
  end

  test "should destroy storage_record" do
    assert_difference("StorageRecord.count", -1) do
      delete storage_record_url(@storage_record), as: :json
    end

    assert_response :no_content
  end
end
