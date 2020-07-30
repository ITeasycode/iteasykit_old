module Iteasykit
  module ApplicationHelper

    def global_search
      @global_search = Iteasykit::FciString.where(fieldable_type: 'Iteasykit::Entity').ransack(params[:q])
    end

    def link_to_add_fields(name, f, type)
      new_object = f.object.send "build_#{type}"
      id = "new_#{type}"
      fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
        render('iteasykit/shared/search/'+type.to_s + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def theme_resolver
      if cookies.permanent[:theme] and cookies.permanent[:theme] != ''
        if params[:theme].presence.present?
          cookies.permanent[:theme] = params[:theme].presence
          cookies.permanent[:theme]
        else
          cookies.permanent[:theme]
        end
      else
        if params[:theme].presence.present?
          cookies.permanent[:theme] = params[:theme].presence
          cookies.permanent[:theme]
        else
          'kbetheme'
        end
      end
    end

    def theme_setting
      YAML.load_file('app/themes/'+theme_resolver+'/setting.yml')
    end

    def lang_switcher(ulclass = 'lang-switcher clearfix',liclass = 'lang', aclass = 'active', ul = :ul, li = :li)
      content_tag(ul, class: ulclass) do
        locale = params[:locale] || I18n.locale
        locale = locale.to_sym
        I18n.available_locales.each do |loc|
          if params[:locale].nil? && I18n.default_locale != loc
            locale_param = '/'+loc.to_s+request.path
          else
            locale_param = ((I18n.default_locale == loc) ? request.path.gsub(locale.to_s+'/', '') : request.path.gsub(locale.to_s, loc.to_s))
          end
            concat content_tag(li, (link_to loc.to_s.gsub("uk", 'ua').upcase, locale_param, class: (locale == loc ? aclass : "")), class: liclass)
        end
      end
    end

    def easy_url(model)
      if model.iteasykit_entity_type.path_root_url?

        if params[:locale]
          '/'+params[:locale]+'/'+model.slug
        else
          '/'+model.slug
        end
      else
        if params[:locale]
          '/'+params[:locale]+'/'+model.iteasykit_entity_type.machine_name+'/'+model.slug
        else
          '/'+model.iteasykit_entity_type.machine_name+'/'+model.slug
        end
      end

    end

  end
end
