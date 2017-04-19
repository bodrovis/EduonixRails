module LocalesConcern
  extend ActiveSupport::Concern

  included do
    PATH_WITH_LOCALE_REGEXP = %r{\A\/((?:#{I18n.available_locales.join('|')})\/?|)}
    before_action :set_locale
    before_action :return_back

    private

    def return_back
      return_to = params[:return_to]
      redirect_to return_to.gsub(PATH_WITH_LOCALE_REGEXP,
                                 "/#{I18n.locale}/") if return_to && return_to =~ PATH_WITH_LOCALE_REGEXP
    end

    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end

    def extract_locale
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end