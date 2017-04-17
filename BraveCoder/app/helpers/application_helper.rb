module ApplicationHelper
  def choose_locale_dropdown
    locales = I18n.available_locales.dup

    content_tag :li, class: 'nav-item dropdown' do
      link_to(t(locales.delete(I18n.locale), scope: [:common, :locales]), '#',
              class: 'nav-link dropdown-toggle',
              data: {toggle: 'dropdown'}) +
          content_tag(:div, class: 'dropdown-menu') do
            locales.inject('') do |string, locale|
              string + link_to(t(locale, scope: [:common, :locales]),
                               root_path(locale: locale, return_to: request.path),
                               class: 'dropdown-item')
            end.html_safe
          end
    end
  end

  def title(content)
    content_for(:page_title) {content}
  end

  def at_page(page = '')
    render 'shared/menu', page: page
  end

  def nav_item(title, url, current_page = '', opts = {})
    content_tag :li, class: "nav-item #{'active' if current_page == title}" do
      link_to title.titleize, url, opts.merge!({class: 'nav-link'})
    end
  end

  def gravatar_for(user:, size: '60', opts: {})
    hash = Digest::MD5.hexdigest user.email
    image_tag "https://www.gravatar.com/avatar/#{hash}?s=#{size}", opts
  end
end