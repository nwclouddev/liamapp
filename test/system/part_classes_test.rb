require "application_system_test_case"

class PartClassesTest < ApplicationSystemTestCase
  setup do
    @part_class = part_classes(:one)
  end

  test "visiting the index" do
    visit part_classes_url
    assert_selector "h1", text: "Part Classes"
  end

  test "creating a Part class" do
    visit part_classes_url
    click_on "New Part Class"

    fill_in "Code", with: @part_class.code
    check "Not used" if @part_class.not_used
    click_on "Create Part class"

    assert_text "Part class was successfully created"
    click_on "Back"
  end

  test "updating a Part class" do
    visit part_classes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @part_class.code
    check "Not used" if @part_class.not_used
    click_on "Update Part class"

    assert_text "Part class was successfully updated"
    click_on "Back"
  end

  test "destroying a Part class" do
    visit part_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Part class was successfully destroyed"
  end
end
