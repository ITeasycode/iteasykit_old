require 'test_helper'

module Iteasykit
  class FcisControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @fci = iteasykit_fcis(:one)
    end

    test "should get index" do
      get fcis_url
      assert_response :success
    end

    test "should get new" do
      get new_fci_url
      assert_response :success
    end

    test "should create fci" do
      assert_difference('Fci.count') do
        post fcis_url, params: { fci: { active: @fci.active, classcls: @fci.classcls, elementcls: @fci.elementcls, fciable_id: @fci.fciable_id, fciable_type: @fci.fciable_type, help: @fci.help, idcls: @fci.idcls, is_filter: @fci.is_filter, is_multi: @fci.is_multi, is_required: @fci.is_required, machine_name: @fci.machine_name, name: @fci.name, placeholder: @fci.placeholder, position: @fci.position, prefix: @fci.prefix, suffix: @fci.suffix, value: @fci.value } }
      end

      assert_redirected_to fci_url(Fci.last)
    end

    test "should show fci" do
      get fci_url(@fci)
      assert_response :success
    end

    test "should get edit" do
      get edit_fci_url(@fci)
      assert_response :success
    end

    test "should update fci" do
      patch fci_url(@fci), params: { fci: { active: @fci.active, classcls: @fci.classcls, elementcls: @fci.elementcls, fciable_id: @fci.fciable_id, fciable_type: @fci.fciable_type, help: @fci.help, idcls: @fci.idcls, is_filter: @fci.is_filter, is_multi: @fci.is_multi, is_required: @fci.is_required, machine_name: @fci.machine_name, name: @fci.name, placeholder: @fci.placeholder, position: @fci.position, prefix: @fci.prefix, suffix: @fci.suffix, value: @fci.value } }
      assert_redirected_to fci_url(@fci)
    end

    test "should destroy fci" do
      assert_difference('Fci.count', -1) do
        delete fci_url(@fci)
      end

      assert_redirected_to fcis_url
    end
  end
end
