require "application_system_test_case"

module Iteasykit
  class PartnersTest < ApplicationSystemTestCase
    setup do
      @partner = iteasykit_partners(:one)
    end

    test "visiting the index" do
      visit partners_url
      assert_selector "h1", text: "Partners"
    end

    test "creating a Partner" do
      visit partners_url
      click_on "New Partner"

      check "Active" if @partner.active
      fill_in "Address", with: @partner.address
      fill_in "City mold", with: @partner.city_mold
      fill_in "City ukr", with: @partner.city_ukr
      fill_in "Coordinates", with: @partner.coordinates
      fill_in "Name", with: @partner.name
      fill_in "Phone", with: @partner.phone
      fill_in "Site", with: @partner.site
      click_on "Create Partner"

      assert_text "Partner was successfully created"
      click_on "Back"
    end

    test "updating a Partner" do
      visit partners_url
      click_on "Edit", match: :first

      check "Active" if @partner.active
      fill_in "Address", with: @partner.address
      fill_in "City mold", with: @partner.city_mold
      fill_in "City ukr", with: @partner.city_ukr
      fill_in "Coordinates", with: @partner.coordinates
      fill_in "Name", with: @partner.name
      fill_in "Phone", with: @partner.phone
      fill_in "Site", with: @partner.site
      click_on "Update Partner"

      assert_text "Partner was successfully updated"
      click_on "Back"
    end

    test "destroying a Partner" do
      visit partners_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Partner was successfully destroyed"
    end
  end
end
