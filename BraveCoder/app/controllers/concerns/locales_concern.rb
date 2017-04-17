module LocalesConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
    before_action :return_back

    private

    def return_back
      return_to = params[:return_to]
      redirect_to return_to.gsub(%r{\A\/((?:#{I18n.available_locales.join('|')})\/|)},
                                 "/#{I18n.locale}/") if return_to
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