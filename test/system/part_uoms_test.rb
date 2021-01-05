require "application_system_test_case"

class PartUomsTest < ApplicationSystemTestCase
  setup do
    @part_uom = part_uoms(:one)
  end

  test "visiting the index" do
    visit part_uoms_url
    assert_selector "h1", text: "Part Uoms"
  end

  test "creating a Part uom" do
    visit part_uoms_url
    click_on "New Part Uom"

    fill_in "Code", with: @part_uom.code
    fill_in "Description", with: @part_uom.description
    check "Not used" if @part_uom.not_used
    click_on "Create Part uom"

    assert_text "Part uom was successfully created"
    click_on "Back"
  end

  test "updating a Part uom" do
    visit part_uoms_url
    click_on "Edit", match: :first

    fill_in "Code", with: @part_uom.code
    fill_in "Description", with: @part_uom.description
    check "Not used" if @part_uom.not_used
    click_on "Update Part uom"

    assert_text "Part uom was successfully updated"
    click_on "Back"
  end

  test "destroying a Part uom" do
    visit part_uoms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Part uom was successfully destroyed"
  end
end
