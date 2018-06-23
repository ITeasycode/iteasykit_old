module Iteasykit
  class Admin::AdminController < Iteasykit::ApplicationController
    theme :admin_theme_resolver

    def admin_theme_resolver
      params[:theme].presence || 'default'
    end

    def current_ability
      @current_ability ||= AdminAbility.new(current_user)
    end

  end
end