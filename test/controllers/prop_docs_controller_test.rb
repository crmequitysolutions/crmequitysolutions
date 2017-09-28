require 'test_helper'

class PropDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prop_doc = prop_docs(:one)
  end

  test "should get index" do
    get prop_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_prop_doc_url
    assert_response :success
  end

  test "should create prop_doc" do
    assert_difference('PropDoc.count') do
      post prop_docs_url, params: { prop_doc: { content: @prop_doc.content, file_name: @prop_doc.file_name, file_type: @prop_doc.file_type, mime_type: @prop_doc.mime_type, prop_doc_id: @prop_doc.prop_doc_id, property_id: @prop_doc.property_id, upload_date: @prop_doc.upload_date } }
    end

    assert_redirected_to prop_doc_url(PropDoc.last)
  end

  test "should show prop_doc" do
    get prop_doc_url(@prop_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_prop_doc_url(@prop_doc)
    assert_response :success
  end

  test "should update prop_doc" do
    patch prop_doc_url(@prop_doc), params: { prop_doc: { content: @prop_doc.content, file_name: @prop_doc.file_name, file_type: @prop_doc.file_type, mime_type: @prop_doc.mime_type, prop_doc_id: @prop_doc.prop_doc_id, property_id: @prop_doc.property_id, upload_date: @prop_doc.upload_date } }
    assert_redirected_to prop_doc_url(@prop_doc)
  end

  test "should destroy prop_doc" do
    assert_difference('PropDoc.count', -1) do
      delete prop_doc_url(@prop_doc)
    end

    assert_redirected_to prop_docs_url
  end
end
