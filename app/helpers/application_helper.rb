module ApplicationHelper
  
  def redcloth(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class, :line_numbers => :table).html_safe)
    end
  end
  
  def article_admin_links(article)
    html = "".html_safe
    if can?(:modify, article) && request.fullpath != root_path
      html << (link_to t(:edit), edit_article_path(article))
      html << " | "
      html << (link_to t(:destroy), article, :confirm => t("confirm.confirm_delete"), :method => :delete)
    end
    return html
  end

  def active_tab(title, path)
    css_class = current_page?(path) ? "active" : ""
    link_to title, path, :class => css_class
  end
end
