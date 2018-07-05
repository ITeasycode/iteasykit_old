module Iteasykit
  class Admin::AdminController < Iteasykit::ApplicationController
    theme :admin_theme_resolver

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to admin_dashboard_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

    def admin_theme_resolver
      params[:theme].presence || 'default'
    end

    def current_ability
      @current_ability ||= AdminAbility.new(current_user)
    end
  end
end