require 'test_helper'

class PartUomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_uom = part_uoms(:one)
  end

  test "should get index" do
    get part_uoms_url
    assert_response :success
  end

  test "should get new" do
    get new_part_uom_url
    assert_response :success
  end

  test "should create part_uom" do
    assert_difference('PartUom.count') do
      post part_uoms_url, params: { part_uom: { code: @part_uom.code, description: @part_uom.description, not_used: @part_uom.not_used } }
    end

    assert_redirected_to part_uom_url(PartUom.last)
  end

  test "should show part_uom" do
    get part_uom_url(@part_uom)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_uom_url(@part_uom)
    assert_response :success
  end

  test "should update part_uom" do
    patch part_uom_url(@part_uom), params: { part_uom: { code: @part_uom.code, description: @part_uom.description, not_used: @part_uom.not_used } }
    assert_redirected_to part_uom_url(@part_uom)
  end

  test "should destroy part_uom" do
    assert_difference('PartUom.count', -1) do
      delete part_uom_url(@part_uom)
    end

    assert_redirected_to part_uoms_url
  end
end
