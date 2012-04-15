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

  # The reason we added this here instead of sorting in the model,
  # its because adding a scope, I believe would have made an active
  # record query.
  #
  # If we added an scope, all the queries we avoided by making the include
  # call explicit in the application controller, would have been made.
  def get_and_sort_articles(category)
    category.articles.sort_by(&:name)
  end
  
  def published_categories
    Category.with_published_articles
  end
end
