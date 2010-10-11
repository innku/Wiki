module ArticlesHelper
  
  def tags_hidden_fields(article)
    list_elements = "".html_safe
    article.tag_list.each do |tag_name|
      list_elements += content_tag(:li, content_tag(:span, tag_name) + content_tag(:a, "X", :href => "#") +
      content_tag(:input, nil, :type => "hidden", :value => tag_name, :name => "article[tag_list][]"))
    end
    
    content_tag(:ul, list_elements, :id => "tag_list")
  end
end
