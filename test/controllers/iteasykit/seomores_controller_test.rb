require 'test_helper'

module Iteasykit
  class SeomoresControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @seomore = iteasykit_seomores(:one)
    end

    test "should get index" do
      get seomores_url
      assert_response :success
    end

    test "should get new" do
      get new_seomore_url
      assert_response :success
    end

    test "should create seomore" do
      assert_difference('Seomore.count') do
        post seomores_url, params: { seomore: { alternate: @seomore.alternate, author: @seomore.author, canonical: @seomore.canonical, description: @seomore.description, keywords: @seomore.keywords, nofollow: @seomore.nofollow, noindex: @seomore.noindex, publisher: @seomore.publisher, refresh: @seomore.refresh, title: @seomore.title } }
      end

      assert_redirected_to seomore_url(Seomore.last)
    end

    test "should show seomore" do
      get seomore_url(@seomore)
      assert_response :success
    end

    test "should get edit" do
      get edit_seomore_url(@seomore)
      assert_response :success
    end

    test "should update seomore" do
      patch seomore_url(@seomore), params: { seomore: { alternate: @seomore.alternate, author: @seomore.author, canonical: @seomore.canonical, description: @seomore.description, keywords: @seomore.keywords, nofollow: @seomore.nofollow, noindex: @seomore.noindex, publisher: @seomore.publisher, refresh: @seomore.refresh, title: @seomore.title } }
      assert_redirected_to seomore_url(@seomore)
    end

    test "should destroy seomore" do
      assert_difference('Seomore.count', -1) do
        delete seomore_url(@seomore)
      end

      assert_redirected_to seomores_url
    end
  end
end
