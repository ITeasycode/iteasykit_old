require "application_system_test_case"

module Iteasykit
  class BlocksTest < ApplicationSystemTestCase
    setup do
      @block = iteasykit_blocks(:one)
    end

    test "visiting the index" do
      visit blocks_url
      assert_selector "h1", text: "Blocks"
    end

    test "creating a Block" do
      visit blocks_url
      click_on "New Block"

      fill_in "Active", with: @block.active
      fill_in "Admin Name", with: @block.admin_name
      fill_in "Csscls", with: @block.csscls
      fill_in "Description Admin", with: @block.description_admin
      fill_in "Elementcls", with: @block.elementcls
      fill_in "Entity Type Lists", with: @block.entity_type_lists
      fill_in "Etl Type", with: @block.etl_type
      fill_in "Idcls", with: @block.idcls
      fill_in "Iteasykit Entity Type", with: @block.iteasykit_entity_type_id
      fill_in "Machine Name", with: @block.machine_name
      fill_in "Position", with: @block.position
      fill_in "Region", with: @block.region
      fill_in "System", with: @block.system
      fill_in "Type Url", with: @block.type_url
      fill_in "Url", with: @block.url
      click_on "Create Block"

      assert_text "Block was successfully created"
      click_on "Back"
    end

    test "updating a Block" do
      visit blocks_url
      click_on "Edit", match: :first

      fill_in "Active", with: @block.active
      fill_in "Admin Name", with: @block.admin_name
      fill_in "Csscls", with: @block.csscls
      fill_in "Description Admin", with: @block.description_admin
      fill_in "Elementcls", with: @block.elementcls
      fill_in "Entity Type Lists", with: @block.entity_type_lists
      fill_in "Etl Type", with: @block.etl_type
      fill_in "Idcls", with: @block.idcls
      fill_in "Iteasykit Entity Type", with: @block.iteasykit_entity_type_id
      fill_in "Machine Name", with: @block.machine_name
      fill_in "Position", with: @block.position
      fill_in "Region", with: @block.region
      fill_in "System", with: @block.system
      fill_in "Type Url", with: @block.type_url
      fill_in "Url", with: @block.url
      click_on "Update Block"

      assert_text "Block was successfully updated"
      click_on "Back"
    end

    test "destroying a Block" do
      visit blocks_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Block was successfully destroyed"
    end
  end
end
