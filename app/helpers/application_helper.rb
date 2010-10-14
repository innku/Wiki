module ApplicationHelper
  
  def redcloth(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def article_admin_links(article)
    html = "".html_safe
    if current_user && current_user == article.user && request.fullpath != root_path
      html << (link_to t(:edit), edit_article_path(article))
      html << " | "
  		html << (link_to t(:destroy), article, :confirm => 'Are you sure?', :method => :delete)
  	end
  	return html
  end
  
  
end
