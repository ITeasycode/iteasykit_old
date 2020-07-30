module ThemesOnRails
  class ActionMailer
    attr_reader :theme_name

    class << self
      def apply_theme(mailer_instance, theme, default_theme, options = {})
        mailer_class  = mailer_instance.class

        @theme_instance = ThemesOnRails::ActionMailer.new(self, theme, default_theme)
        # prepend view path
        mailer_instance.prepend_view_path(@theme_instance.theme_view_path)
        # liquid file system
        Liquid::Template.file_system = Liquid::Rails::FileSystem.new(@theme_instance.theme_view_path) if defined?(Liquid::Rails)

        mailer_class.default theme: @theme_instance.theme_name
        # mailer_class.layout  @theme_instance.theme_name
      end
    end

    def initialize(mailer, theme, default_theme)
      @mailer = mailer
      @default_theme = default_theme
      @theme_name = _theme_name(theme)
    end

    def theme_view_path
      "#{prefix_path}/#{@theme_name}/views"
    end

    def prefix_path
      "#{Rails.root}/app/themes"
    end

    private

      def _theme_name(theme)
        case theme
        when String     then theme
        when Proc       then theme.call(@mailer).to_s
        when Symbol
          @mailer.respond_to?(theme, true) ? @mailer.send(theme).to_s : theme.to_s
        when nil        then @default_theme
        else
          raise ArgumentError,
            "String, Proc, or Symbol, expected for `theme'; you passed #{theme.inspect}"
        end
      end
  end
end
