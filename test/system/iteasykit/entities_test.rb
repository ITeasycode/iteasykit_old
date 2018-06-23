require "application_system_test_case"

module Iteasykit
  class EntitiesTest < ApplicationSystemTestCase
    setup do
      @entity = iteasykit_entities(:one)
    end

    test "visiting the index" do
      visit entities_url
      assert_selector "h1", text: "Entities"
    end

    test "creating a Entity" do
      visit entities_url
      click_on "New Entity"

      fill_in "Active", with: @entity.active
      fill_in "Iteasykit Entity Type", with: @entity.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @entity.iteasykit_seomore_id
      fill_in "Machine Name", with: @entity.machine_name
      fill_in "Sticky", with: @entity.sticky
      click_on "Create Entity"

      assert_text "Entity was successfully created"
      click_on "Back"
    end

    test "updating a Entity" do
      visit entities_url
      click_on "Edit", match: :first

      fill_in "Active", with: @entity.active
      fill_in "Iteasykit Entity Type", with: @entity.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @entity.iteasykit_seomore_id
      fill_in "Machine Name", with: @entity.machine_name
      fill_in "Sticky", with: @entity.sticky
      click_on "Update Entity"

      assert_text "Entity was successfully updated"
      click_on "Back"
    end

    test "destroying a Entity" do
      visit entities_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Entity was successfully destroyed"
    end
  end
end
