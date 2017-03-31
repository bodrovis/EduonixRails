ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  "<div class=\"has-danger\">#{html_tag}</div>".html_safe
end