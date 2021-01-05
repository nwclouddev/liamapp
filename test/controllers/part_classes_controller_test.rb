require 'test_helper'

class PartClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_class = part_classes(:one)
  end

  test "should get index" do
    get part_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_part_class_url
    assert_response :success
  end

  test "should create part_class" do
    assert_difference('PartClass.count') do
      post part_classes_url, params: { part_class: { code: @part_class.code, not_used: @part_class.not_used } }
    end

    assert_redirected_to part_class_url(PartClass.last)
  end

  test "should show part_class" do
    get part_class_url(@part_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_class_url(@part_class)
    assert_response :success
  end

  test "should update part_class" do
    patch part_class_url(@part_class), params: { part_class: { code: @part_class.code, not_used: @part_class.not_used } }
    assert_redirected_to part_class_url(@part_class)
  end

  test "should destroy part_class" do
    assert_difference('PartClass.count', -1) do
      delete part_class_url(@part_class)
    end

    assert_redirected_to part_classes_url
  end
end
