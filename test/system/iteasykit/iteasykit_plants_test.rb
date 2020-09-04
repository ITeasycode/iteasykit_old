require "application_system_test_case"

module Iteasykit
  class IteasykitPlantsTest < ApplicationSystemTestCase
    setup do
      @iteasykit_plant = iteasykit_iteasykit_plants(:one)
    end

    test "visiting the index" do
      visit iteasykit_plants_url
      assert_selector "h1", text: "Iteasykit Plants"
    end

    test "creating a Iteasykit plant" do
      visit iteasykit_plants_url
      click_on "New Iteasykit Plant"

      check "Active" if @iteasykit_plant.active
      fill_in "Address map", with: @iteasykit_plant.address_map
      fill_in "Cordinates", with: @iteasykit_plant.cordinates
      fill_in "Country", with: @iteasykit_plant.country
      fill_in "Email", with: @iteasykit_plant.email
      fill_in "Geodanniye", with: @iteasykit_plant.geodanniye
      fill_in "Phone", with: @iteasykit_plant.phone
      fill_in "Site", with: @iteasykit_plant.site
      click_on "Create Iteasykit plant"

      assert_text "Iteasykit plant was successfully created"
      click_on "Back"
    end

    test "updating a Iteasykit plant" do
      visit iteasykit_plants_url
      click_on "Edit", match: :first

      check "Active" if @iteasykit_plant.active
      fill_in "Address map", with: @iteasykit_plant.address_map
      fill_in "Cordinates", with: @iteasykit_plant.cordinates
      fill_in "Country", with: @iteasykit_plant.country
      fill_in "Email", with: @iteasykit_plant.email
      fill_in "Geodanniye", with: @iteasykit_plant.geodanniye
      fill_in "Phone", with: @iteasykit_plant.phone
      fill_in "Site", with: @iteasykit_plant.site
      click_on "Update Iteasykit plant"

      assert_text "Iteasykit plant was successfully updated"
      click_on "Back"
    end

    test "destroying a Iteasykit plant" do
      visit iteasykit_plants_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Iteasykit plant was successfully destroyed"
    end
  end
end
