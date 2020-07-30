require "application_system_test_case"

module Iteasykit
  class FcisTest < ApplicationSystemTestCase
    setup do
      @fci = iteasykit_fcis(:one)
    end

    test "visiting the index" do
      visit fcis_url
      assert_selector "h1", text: "Fcis"
    end

    test "creating a Fci" do
      visit fcis_url
      click_on "New Fci"

      fill_in "Active", with: @fci.active
      fill_in "Classcls", with: @fci.classcls
      fill_in "Elementcls", with: @fci.elementcls
      fill_in "Fciable", with: @fci.fciable_id
      fill_in "Fciable Type", with: @fci.fciable_type
      fill_in "Help", with: @fci.help
      fill_in "Idcls", with: @fci.idcls
      fill_in "Is Filter", with: @fci.is_filter
      fill_in "Is Multi", with: @fci.is_multi
      fill_in "Is Required", with: @fci.is_required
      fill_in "Machine Name", with: @fci.machine_name
      fill_in "Name", with: @fci.name
      fill_in "Placeholder", with: @fci.placeholder
      fill_in "Position", with: @fci.position
      fill_in "Prefix", with: @fci.prefix
      fill_in "Suffix", with: @fci.suffix
      fill_in "Value", with: @fci.value
      click_on "Create Fci"

      assert_text "Fci was successfully created"
      click_on "Back"
    end

    test "updating a Fci" do
      visit fcis_url
      click_on "Edit", match: :first

      fill_in "Active", with: @fci.active
      fill_in "Classcls", with: @fci.classcls
      fill_in "Elementcls", with: @fci.elementcls
      fill_in "Fciable", with: @fci.fciable_id
      fill_in "Fciable Type", with: @fci.fciable_type
      fill_in "Help", with: @fci.help
      fill_in "Idcls", with: @fci.idcls
      fill_in "Is Filter", with: @fci.is_filter
      fill_in "Is Multi", with: @fci.is_multi
      fill_in "Is Required", with: @fci.is_required
      fill_in "Machine Name", with: @fci.machine_name
      fill_in "Name", with: @fci.name
      fill_in "Placeholder", with: @fci.placeholder
      fill_in "Position", with: @fci.position
      fill_in "Prefix", with: @fci.prefix
      fill_in "Suffix", with: @fci.suffix
      fill_in "Value", with: @fci.value
      click_on "Update Fci"

      assert_text "Fci was successfully updated"
      click_on "Back"
    end

    test "destroying a Fci" do
      visit fcis_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Fci was successfully destroyed"
    end
  end
end
