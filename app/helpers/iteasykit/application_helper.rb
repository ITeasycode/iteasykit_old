module Iteasykit
  module ApplicationHelper

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

    def lang_switcher
      content_tag(:ul, class: 'lang-switcher clearfix') do
        I18n.available_locales.each do |loc|
          locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
          if locale_param == "/" || locale_param == "/"+loc.to_s
            concat content_tag(:li, (link_to loc, locale_param), class: (I18n.locale == loc ? "active" : ""))
          else
            concat content_tag(:li, (link_to loc, locale_param.permit!), class: (I18n.locale == loc ? "active" : ""))
          end
        end
      end
    end

  end
end
