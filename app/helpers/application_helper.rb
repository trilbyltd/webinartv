module ApplicationHelper
  
  def title(page_title)
    content_for (:title) { page_title}
  end

  def safe_url(url)
    "".html_safe + url
  end

end
