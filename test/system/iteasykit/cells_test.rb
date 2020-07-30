require "application_system_test_case"

module Iteasykit
  class CellsTest < ApplicationSystemTestCase
    setup do
      @cell = iteasykit_cells(:one)
    end

    test "visiting the index" do
      visit cells_url
      assert_selector "h1", text: "Cells"
    end

    test "creating a Cell" do
      visit cells_url
      click_on "New Cell"

      fill_in "Active", with: @cell.active
      fill_in "Group", with: @cell.group
      fill_in "Iteasykit Entity Type", with: @cell.iteasykit_entity_type_id
      fill_in "Machine Name", with: @cell.machine_name
      fill_in "Position", with: @cell.position
      fill_in "Sticky", with: @cell.sticky
      click_on "Create Cell"

      assert_text "Cell was successfully created"
      click_on "Back"
    end

    test "updating a Cell" do
      visit cells_url
      click_on "Edit", match: :first

      fill_in "Active", with: @cell.active
      fill_in "Group", with: @cell.group
      fill_in "Iteasykit Entity Type", with: @cell.iteasykit_entity_type_id
      fill_in "Machine Name", with: @cell.machine_name
      fill_in "Position", with: @cell.position
      fill_in "Sticky", with: @cell.sticky
      click_on "Update Cell"

      assert_text "Cell was successfully updated"
      click_on "Back"
    end

    test "destroying a Cell" do
      visit cells_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Cell was successfully destroyed"
    end
  end
end
