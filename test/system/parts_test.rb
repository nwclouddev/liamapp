require "application_system_test_case"

class PartsTest < ApplicationSystemTestCase
  setup do
    @part = parts(:one)
  end

  test "visiting the index" do
    visit parts_url
    assert_selector "h1", text: "Parts"
  end

  test "creating a Part" do
    visit parts_url
    click_on "New Part"

    fill_in "Code", with: @part.code
    fill_in "Description", with: @part.description
    check "Not used" if @part.not_used
    fill_in "Part class", with: @part.part_class_id
    fill_in "Part uom", with: @part.part_uom_id
    click_on "Create Part"

    assert_text "Part was successfully created"
    click_on "Back"
  end

  test "updating a Part" do
    visit parts_url
    click_on "Edit", match: :first

    fill_in "Code", with: @part.code
    fill_in "Description", with: @part.description
    check "Not used" if @part.not_used
    fill_in "Part class", with: @part.part_class_id
    fill_in "Part uom", with: @part.part_uom_id
    click_on "Update Part"

    assert_text "Part was successfully updated"
    click_on "Back"
  end

  test "destroying a Part" do
    visit parts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Part was successfully destroyed"
  end
end
