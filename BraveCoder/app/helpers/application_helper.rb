module ApplicationHelper
  def title(content)
    content_for(:page_title) {content}
  end
end