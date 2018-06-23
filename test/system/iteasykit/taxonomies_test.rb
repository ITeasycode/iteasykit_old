require "application_system_test_case"

module Iteasykit
  class TaxonomiesTest < ApplicationSystemTestCase
    setup do
      @taxonomy = iteasykit_taxonomies(:one)
    end

    test "visiting the index" do
      visit taxonomies_url
      assert_selector "h1", text: "Taxonomies"
    end

    test "creating a Taxonomy" do
      visit taxonomies_url
      click_on "New Taxonomy"

      fill_in "Active", with: @taxonomy.active
      fill_in "Ancestry", with: @taxonomy.ancestry
      fill_in "Ancestry Depth", with: @taxonomy.ancestry_depth
      fill_in "Blocked", with: @taxonomy.blocked
      fill_in "Iteasykit Entity Type", with: @taxonomy.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @taxonomy.iteasykit_seomore_id
      fill_in "Position", with: @taxonomy.position
      fill_in "Sticky", with: @taxonomy.sticky
      click_on "Create Taxonomy"

      assert_text "Taxonomy was successfully created"
      click_on "Back"
    end

    test "updating a Taxonomy" do
      visit taxonomies_url
      click_on "Edit", match: :first

      fill_in "Active", with: @taxonomy.active
      fill_in "Ancestry", with: @taxonomy.ancestry
      fill_in "Ancestry Depth", with: @taxonomy.ancestry_depth
      fill_in "Blocked", with: @taxonomy.blocked
      fill_in "Iteasykit Entity Type", with: @taxonomy.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @taxonomy.iteasykit_seomore_id
      fill_in "Position", with: @taxonomy.position
      fill_in "Sticky", with: @taxonomy.sticky
      click_on "Update Taxonomy"

      assert_text "Taxonomy was successfully updated"
      click_on "Back"
    end

    test "destroying a Taxonomy" do
      visit taxonomies_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Taxonomy was successfully destroyed"
    end
  end
end
