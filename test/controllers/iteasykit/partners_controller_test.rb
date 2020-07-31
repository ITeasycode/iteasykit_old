require 'test_helper'

module Iteasykit
  class PartnersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @partner = iteasykit_partners(:one)
    end

    test "should get index" do
      get partners_url
      assert_response :success
    end

    test "should get new" do
      get new_partner_url
      assert_response :success
    end

    test "should create partner" do
      assert_difference('Partner.count') do
        post partners_url, params: { partner: { active: @partner.active, address: @partner.address, city_mold: @partner.city_mold, city_ukr: @partner.city_ukr, coordinates: @partner.coordinates, name: @partner.name, phone: @partner.phone, site: @partner.site } }
      end

      assert_redirected_to partner_url(Partner.last)
    end

    test "should show partner" do
      get partner_url(@partner)
      assert_response :success
    end

    test "should get edit" do
      get edit_partner_url(@partner)
      assert_response :success
    end

    test "should update partner" do
      patch partner_url(@partner), params: { partner: { active: @partner.active, address: @partner.address, city_mold: @partner.city_mold, city_ukr: @partner.city_ukr, coordinates: @partner.coordinates, name: @partner.name, phone: @partner.phone, site: @partner.site } }
      assert_redirected_to partner_url(@partner)
    end

    test "should destroy partner" do
      assert_difference('Partner.count', -1) do
        delete partner_url(@partner)
      end

      assert_redirected_to partners_url
    end
  end
end
