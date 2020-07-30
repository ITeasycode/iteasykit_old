require 'test_helper'

module Iteasykit
  class PageControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get dashboard" do
      get page_dashboard_url
      assert_response :success
    end

    test "should get help" do
      get page_help_url
      assert_response :success
    end

  end
end
