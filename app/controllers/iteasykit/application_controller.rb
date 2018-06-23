module Iteasykit
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_paper_trail_whodunnit
    before_action :set_locale

    theme :theme_resolver

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

    def set_locale
      if params[:locale].present?
        I18n.locale = params[:locale]
      else
        #if http_accept_language.compatible_language_from(I18n.available_locales) == System.find_by_key(:locale).value.to_sym
        #I18n.locale = System.find_by_key(:locale).value.to_sym
        #else
        I18n.locale = :en
        #end
      end
      cookies.permanent[:educator_locale] = I18n.locale
    end


    def default_url_options(options={})
      {locale: I18n.locale}
    end

    private

    def theme_resolver
        'capital'
    end

    def fci_saver(instance, params)
      params[:fcis].as_json.each do |field|
        m = ('Iteasykit::'+field[1].keys[0].camelize).constantize
        if field[1].keys[0] == "fci_image"
          image = FciImage.update_or_create_by({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id})
          image.file.attach(params[:fcis][field[0]]["fci_image"]["file"])
        else
          m.update_or_create_by({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id}, {value: field[1].values[0]})
        end
      end
    end

    protected

    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
  end
end
