require "application_system_test_case"

module Iteasykit
  class SeomoresTest < ApplicationSystemTestCase
    setup do
      @seomore = iteasykit_seomores(:one)
    end

    test "visiting the index" do
      visit seomores_url
      assert_selector "h1", text: "Seomores"
    end

    test "creating a Seomore" do
      visit seomores_url
      click_on "New Seomore"

      fill_in "Alternate", with: @seomore.alternate
      fill_in "Author", with: @seomore.author
      fill_in "Canonical", with: @seomore.canonical
      fill_in "Description", with: @seomore.description
      fill_in "Keywords", with: @seomore.keywords
      fill_in "Nofollow", with: @seomore.nofollow
      fill_in "Noindex", with: @seomore.noindex
      fill_in "Publisher", with: @seomore.publisher
      fill_in "Refresh", with: @seomore.refresh
      fill_in "Title", with: @seomore.title
      click_on "Create Seomore"

      assert_text "Seomore was successfully created"
      click_on "Back"
    end

    test "updating a Seomore" do
      visit seomores_url
      click_on "Edit", match: :first

      fill_in "Alternate", with: @seomore.alternate
      fill_in "Author", with: @seomore.author
      fill_in "Canonical", with: @seomore.canonical
      fill_in "Description", with: @seomore.description
      fill_in "Keywords", with: @seomore.keywords
      fill_in "Nofollow", with: @seomore.nofollow
      fill_in "Noindex", with: @seomore.noindex
      fill_in "Publisher", with: @seomore.publisher
      fill_in "Refresh", with: @seomore.refresh
      fill_in "Title", with: @seomore.title
      click_on "Update Seomore"

      assert_text "Seomore was successfully updated"
      click_on "Back"
    end

    test "destroying a Seomore" do
      visit seomores_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Seomore was successfully destroyed"
    end
  end
end
