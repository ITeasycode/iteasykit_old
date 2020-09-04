require 'test_helper'

module Iteasykit
  class IteasykitPlantsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @iteasykit_plant = iteasykit_iteasykit_plants(:one)
    end

    test "should get index" do
      get iteasykit_plants_url
      assert_response :success
    end

    test "should get new" do
      get new_iteasykit_plant_url
      assert_response :success
    end

    test "should create iteasykit_plant" do
      assert_difference('IteasykitPlant.count') do
        post iteasykit_plants_url, params: { iteasykit_plant: { active: @iteasykit_plant.active, address_map: @iteasykit_plant.address_map, cordinates: @iteasykit_plant.cordinates, country: @iteasykit_plant.country, email: @iteasykit_plant.email, geodanniye: @iteasykit_plant.geodanniye, phone: @iteasykit_plant.phone, site: @iteasykit_plant.site } }
      end

      assert_redirected_to iteasykit_plant_url(IteasykitPlant.last)
    end

    test "should show iteasykit_plant" do
      get iteasykit_plant_url(@iteasykit_plant)
      assert_response :success
    end

    test "should get edit" do
      get edit_iteasykit_plant_url(@iteasykit_plant)
      assert_response :success
    end

    test "should update iteasykit_plant" do
      patch iteasykit_plant_url(@iteasykit_plant), params: { iteasykit_plant: { active: @iteasykit_plant.active, address_map: @iteasykit_plant.address_map, cordinates: @iteasykit_plant.cordinates, country: @iteasykit_plant.country, email: @iteasykit_plant.email, geodanniye: @iteasykit_plant.geodanniye, phone: @iteasykit_plant.phone, site: @iteasykit_plant.site } }
      assert_redirected_to iteasykit_plant_url(@iteasykit_plant)
    end

    test "should destroy iteasykit_plant" do
      assert_difference('IteasykitPlant.count', -1) do
        delete iteasykit_plant_url(@iteasykit_plant)
      end

      assert_redirected_to iteasykit_plants_url
    end
  end
end
