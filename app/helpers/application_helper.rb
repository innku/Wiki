module ApplicationHelper
  
  def redcloth(text)
    RedCloth.new(text).to_html.html_safe
  end
  
  # def render_side_menu
  #   cat = Category.all
  #   menu = "".html_safe
  #   cat.each do |ctgry|
  #     menu += content_tag(:span,ctgry.name)
  #     articles = "".html_safe
  #     arts = Article.find_by_category_id(ctgry.id)
  #     arts.each do |art|
  #       articles += content_tag(:li,art.name)
  #     end
  #     content_tag(:ul,articles)
  #   end
  #   menu
  # end
  
end
