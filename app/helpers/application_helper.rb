module ApplicationHelper
  
  def redcloth(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  def render_side_menu
    cat = Category.all
    menu = "".html_safe
    menu += (link_to "Home", "/home")
    menu+= content_tag(:br,nil)
    menu+= content_tag(:br,nil)
    
    cat.each do |ctgry|
      menu += content_tag(:li,ctgry.name)
      articles = "".html_safe
      arts = Article.where("category_id = ?",ctgry.id)
      arts.each do |art|
         articles += content_tag(:li,(link_to art.name, art))
      end
      articles_list = "".html_safe
      articles_list += content_tag(:ul,articles, :class => "childList")
      menu += articles_list
    end
    menu = content_tag(:ul,menu)
    
    menu
  end
  
  def render_featured_article
    article = Article.first(:order => ("hit_count DESC"))
    content = "".html_safe
    content += content_tag(:p, content_tag(:b, t(:name) + ": ") + article.name)
    content += content_tag(:p, content_tag(:b, t(:description) + ": ") + redcloth(article.description))
    content += content_tag(:p, content_tag(:b, t(:content) + ": ") + redcloth(article.content))
    content += content_tag(:p, content_tag(:b, t(:hit_count) + ": ") + article.hit_count.to_s)
    
    content_tag(:div, content, :class => "featured")
  end
  
end
