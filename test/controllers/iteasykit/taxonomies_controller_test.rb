require 'test_helper'

module Iteasykit
  class TaxonomiesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @taxonomy = iteasykit_taxonomies(:one)
    end

    test "should get index" do
      get taxonomies_url
      assert_response :success
    end

    test "should get new" do
      get new_taxonomy_url
      assert_response :success
    end

    test "should create taxonomy" do
      assert_difference('Taxonomy.count') do
        post taxonomies_url, params: { taxonomy: { active: @taxonomy.active, ancestry: @taxonomy.ancestry, ancestry_depth: @taxonomy.ancestry_depth, blocked: @taxonomy.blocked, iteasykit_entity_type_id: @taxonomy.iteasykit_entity_type_id, iteasykit_seomore_id: @taxonomy.iteasykit_seomore_id, position: @taxonomy.position, sticky: @taxonomy.sticky } }
      end

      assert_redirected_to taxonomy_url(Taxonomy.last)
    end

    test "should show taxonomy" do
      get taxonomy_url(@taxonomy)
      assert_response :success
    end

    test "should get edit" do
      get edit_taxonomy_url(@taxonomy)
      assert_response :success
    end

    test "should update taxonomy" do
      patch taxonomy_url(@taxonomy), params: { taxonomy: { active: @taxonomy.active, ancestry: @taxonomy.ancestry, ancestry_depth: @taxonomy.ancestry_depth, blocked: @taxonomy.blocked, iteasykit_entity_type_id: @taxonomy.iteasykit_entity_type_id, iteasykit_seomore_id: @taxonomy.iteasykit_seomore_id, position: @taxonomy.position, sticky: @taxonomy.sticky } }
      assert_redirected_to taxonomy_url(@taxonomy)
    end

    test "should destroy taxonomy" do
      assert_difference('Taxonomy.count', -1) do
        delete taxonomy_url(@taxonomy)
      end

      assert_redirected_to taxonomies_url
    end
  end
end
