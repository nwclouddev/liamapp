require 'test_helper'

class BinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bin = bins(:one)
  end

  test "should get index" do
    get bins_url
    assert_response :success
  end

  test "should get new" do
    get new_bin_url
    assert_response :success
  end

  test "should create bin" do
    assert_difference('Bin.count') do
      post bins_url, params: { bin: { code: @bin.code, description: @bin.description, organization_id: @bin.organization_id } }
    end

    assert_redirected_to bin_url(Bin.last)
  end

  test "should show bin" do
    get bin_url(@bin)
    assert_response :success
  end

  test "should get edit" do
    get edit_bin_url(@bin)
    assert_response :success
  end

  test "should update bin" do
    patch bin_url(@bin), params: { bin: { code: @bin.code, description: @bin.description, organization_id: @bin.organization_id } }
    assert_redirected_to bin_url(@bin)
  end

  test "should destroy bin" do
    assert_difference('Bin.count', -1) do
      delete bin_url(@bin)
    end

    assert_redirected_to bins_url
  end
end
