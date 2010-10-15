module ApplicationHelper
  
  def redcloth(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class).html_safe)
    end
  end
  
  def article_admin_links(article)
    html = "".html_safe
    if can?(:modify, article) && request.fullpath != root_path
      html << (link_to t(:edit), edit_article_path(article))
      html << " | "
  		html << (link_to t(:destroy), article, :confirm => 'Are you sure?', :method => :delete)
  	end
  	return html
  end
  
  
  
end
