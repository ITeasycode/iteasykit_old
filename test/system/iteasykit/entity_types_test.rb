require "application_system_test_case"

module Iteasykit
  class EntityTypesTest < ApplicationSystemTestCase
    setup do
      @entity_type = iteasykit_entity_types(:one)
    end

    test "visiting the index" do
      visit entity_types_url
      assert_selector "h1", text: "Entity Types"
    end

    test "creating a Entity type" do
      visit entity_types_url
      click_on "New Entity Type"

      fill_in "Active", with: @entity_type.active
      fill_in "Comment", with: @entity_type.comment
      fill_in "Description", with: @entity_type.description
      fill_in "Has Title", with: @entity_type.has_title
      fill_in "Help", with: @entity_type.help
      fill_in "Label Title", with: @entity_type.label_title
      fill_in "Machine Name", with: @entity_type.machine_name
      fill_in "Name", with: @entity_type.name
      fill_in "Nesting", with: @entity_type.nesting
      fill_in "Path Root Url", with: @entity_type.path_root_url
      fill_in "Position", with: @entity_type.position
      fill_in "Relation", with: @entity_type.relation
      click_on "Create Entity type"

      assert_text "Entity type was successfully created"
      click_on "Back"
    end

    test "updating a Entity type" do
      visit entity_types_url
      click_on "Edit", match: :first

      fill_in "Active", with: @entity_type.active
      fill_in "Comment", with: @entity_type.comment
      fill_in "Description", with: @entity_type.description
      fill_in "Has Title", with: @entity_type.has_title
      fill_in "Help", with: @entity_type.help
      fill_in "Label Title", with: @entity_type.label_title
      fill_in "Machine Name", with: @entity_type.machine_name
      fill_in "Name", with: @entity_type.name
      fill_in "Nesting", with: @entity_type.nesting
      fill_in "Path Root Url", with: @entity_type.path_root_url
      fill_in "Position", with: @entity_type.position
      fill_in "Relation", with: @entity_type.relation
      click_on "Update Entity type"

      assert_text "Entity type was successfully updated"
      click_on "Back"
    end

    test "destroying a Entity type" do
      visit entity_types_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Entity type was successfully destroyed"
    end
  end
end
