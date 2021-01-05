require "application_system_test_case"

class BinsTest < ApplicationSystemTestCase
  setup do
    @bin = bins(:one)
  end

  test "visiting the index" do
    visit bins_url
    assert_selector "h1", text: "Bins"
  end

  test "creating a Bin" do
    visit bins_url
    click_on "New Bin"

    fill_in "Code", with: @bin.code
    fill_in "Description", with: @bin.description
    fill_in "Organization", with: @bin.organization_id
    click_on "Create Bin"

    assert_text "Bin was successfully created"
    click_on "Back"
  end

  test "updating a Bin" do
    visit bins_url
    click_on "Edit", match: :first

    fill_in "Code", with: @bin.code
    fill_in "Description", with: @bin.description
    fill_in "Organization", with: @bin.organization_id
    click_on "Update Bin"

    assert_text "Bin was successfully updated"
    click_on "Back"
  end

  test "destroying a Bin" do
    visit bins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bin was successfully destroyed"
  end
end
