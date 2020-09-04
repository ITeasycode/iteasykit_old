module Iteasykit
  class ApplicationController < ActionController::Base
    #force_ssl
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_paper_trail_whodunnit
    before_action :set_locale
    #protect_from_forgery with: :null_session UnknownController
  #  rescue_from Exception, :with => :render_404
    #rescue_from ActionController::RoutingError, :with => :render_404
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_404
   # rescue_from ActionController::ParameterMissing, :with => :render_404
    theme :theme_resolver

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      cookies.permanent[:educator_locale] = I18n.locale
    end

    def global_search
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
    end

    def default_url_options(options={})
      {locale: I18n.locale}
    end
    

    private

    def theme_resolver
        'taxihohne'
    end

    def fci_saver(instance, params)
      if params[:fcis].present?
        params[:fcis].as_json.each do |field|
          if Fci.find(field[0]).is_multi?
            m = ('Iteasykit::'+field[1].first.keys[0].camelize).constantize
            n = 0
            field[1].each do |i|
              if i.keys[0] == "fci_image"
                image = FciImage.create({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id})
                image.file.attach(params[:fcis][field[0]][n]["fci_image"]["file"])
                n += 1
              else
                m.update_or_create_by({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id}, {value: field[1].values[0]})
                n += 1
              end
            end
          else
            m = ('Iteasykit::'+field[1].keys[0].camelize).constantize
            if field[1].keys[0] == "fci_image"
              image = FciImage.update_or_create_by({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id})
              image.file.attach(params[:fcis][field[0]]["fci_image"]["file"])
            else
              m.update_or_create_by({iteasykit_fci_id: field[0], fieldable_type: "Iteasykit::#{instance.class.class_name.gsub("Iteasykit", '')}", fieldable_id: instance.id}, {value: field[1].values[0]})
            end
          end
        end
      end
    end

    def after_sign_in_path_for(resource)
      sign_in_url = new_user_session_url
      if request.referer == sign_in_url
        super
      else
        request.referer || root_path
      end
    end

    def after_sign_out_path_for(resource)
      sign_in_url = new_user_session_url
      if request.referer == sign_in_url
        super
      else
        request.referer || root_path
      end
    end


    protected

    def configure_permitted_parameters
      added_attrs = [:email, :password, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end

    private
    
    def render_404(exception = nil)
      redirect_to '/entities/error_404'
    end

    def resource_name
      :user
    end
    helper_method :resource_name

    def resource
      @resource ||= User.new
    end
    helper_method :resource

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
    helper_method :devise_mapping

    def resource_class
      User
    end
    helper_method :resource_class

  end
end
