module ApplicationHelper
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