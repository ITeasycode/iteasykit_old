require 'test_helper'

module Iteasykit
  class EntityTypesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @entity_type = iteasykit_entity_types(:one)
    end

    test "should get index" do
      get entity_types_url
      assert_response :success
    end

    test "should get new" do
      get new_entity_type_url
      assert_response :success
    end

    test "should create entity_type" do
      assert_difference('EntityType.count') do
        post entity_types_url, params: { entity_type: { active: @entity_type.active, comment: @entity_type.comment, description: @entity_type.description, has_title: @entity_type.has_title, help: @entity_type.help, label_title: @entity_type.label_title, machine_name: @entity_type.machine_name, name: @entity_type.name, nesting: @entity_type.nesting, path_root_url: @entity_type.path_root_url, position: @entity_type.position, relation: @entity_type.relation } }
      end

      assert_redirected_to entity_type_url(EntityType.last)
    end

    test "should show entity_type" do
      get entity_type_url(@entity_type)
      assert_response :success
    end

    test "should get edit" do
      get edit_entity_type_url(@entity_type)
      assert_response :success
    end

    test "should update entity_type" do
      patch entity_type_url(@entity_type), params: { entity_type: { active: @entity_type.active, comment: @entity_type.comment, description: @entity_type.description, has_title: @entity_type.has_title, help: @entity_type.help, label_title: @entity_type.label_title, machine_name: @entity_type.machine_name, name: @entity_type.name, nesting: @entity_type.nesting, path_root_url: @entity_type.path_root_url, position: @entity_type.position, relation: @entity_type.relation } }
      assert_redirected_to entity_type_url(@entity_type)
    end

    test "should destroy entity_type" do
      assert_difference('EntityType.count', -1) do
        delete entity_type_url(@entity_type)
      end

      assert_redirected_to entity_types_url
    end
  end
end
