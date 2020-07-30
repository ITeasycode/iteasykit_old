require 'test_helper'

module Iteasykit
  class BlocksControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @block = iteasykit_blocks(:one)
    end

    test "should get index" do
      get blocks_url
      assert_response :success
    end

    test "should get new" do
      get new_block_url
      assert_response :success
    end

    test "should create block" do
      assert_difference('Block.count') do
        post blocks_url, params: { block: { active: @block.active, admin_name: @block.admin_name, csscls: @block.csscls, description_admin: @block.description_admin, elementcls: @block.elementcls, entity_type_lists: @block.entity_type_lists, etl_type: @block.etl_type, idcls: @block.idcls, iteasykit_entity_type_id: @block.iteasykit_entity_type_id, machine_name: @block.machine_name, position: @block.position, region: @block.region, system: @block.system, type_url: @block.type_url, url: @block.url } }
      end

      assert_redirected_to block_url(Block.last)
    end

    test "should show block" do
      get block_url(@block)
      assert_response :success
    end

    test "should get edit" do
      get edit_block_url(@block)
      assert_response :success
    end

    test "should update block" do
      patch block_url(@block), params: { block: { active: @block.active, admin_name: @block.admin_name, csscls: @block.csscls, description_admin: @block.description_admin, elementcls: @block.elementcls, entity_type_lists: @block.entity_type_lists, etl_type: @block.etl_type, idcls: @block.idcls, iteasykit_entity_type_id: @block.iteasykit_entity_type_id, machine_name: @block.machine_name, position: @block.position, region: @block.region, system: @block.system, type_url: @block.type_url, url: @block.url } }
      assert_redirected_to block_url(@block)
    end

    test "should destroy block" do
      assert_difference('Block.count', -1) do
        delete block_url(@block)
      end

      assert_redirected_to blocks_url
    end
  end
end
