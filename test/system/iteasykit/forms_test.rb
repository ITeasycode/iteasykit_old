require "application_system_test_case"

module Iteasykit
  class FormsTest < ApplicationSystemTestCase
    setup do
      @form = iteasykit_forms(:one)
    end

    test "visiting the index" do
      visit forms_url
      assert_selector "h1", text: "Forms"
    end

    test "creating a Form" do
      visit forms_url
      click_on "New Form"

      fill_in "Active", with: @form.active
      fill_in "Calc", with: @form.calc
      fill_in "Group", with: @form.group
      fill_in "Iteasykit Entity Type", with: @form.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @form.iteasykit_seomore_id
      fill_in "Machine Name", with: @form.machine_name
      fill_in "Position", with: @form.position
      fill_in "Slug", with: @form.slug
      fill_in "Sticky", with: @form.sticky
      click_on "Create Form"

      assert_text "Form was successfully created"
      click_on "Back"
    end

    test "updating a Form" do
      visit forms_url
      click_on "Edit", match: :first

      fill_in "Active", with: @form.active
      fill_in "Calc", with: @form.calc
      fill_in "Group", with: @form.group
      fill_in "Iteasykit Entity Type", with: @form.iteasykit_entity_type_id
      fill_in "Iteasykit Seomore", with: @form.iteasykit_seomore_id
      fill_in "Machine Name", with: @form.machine_name
      fill_in "Position", with: @form.position
      fill_in "Slug", with: @form.slug
      fill_in "Sticky", with: @form.sticky
      click_on "Update Form"

      assert_text "Form was successfully updated"
      click_on "Back"
    end

    test "destroying a Form" do
      visit forms_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Form was successfully destroyed"
    end
  end
end
