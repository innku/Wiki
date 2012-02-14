module ArticlesHelper
  
  def tags_hidden_fields(article)
    list_elements = "".html_safe
    article.tag_list.each do |tag_name|
      list_elements += content_tag(:li, content_tag(:span, tag_name) + content_tag(:a, "X", :href => "#") +
      content_tag(:input, nil, :type => "hidden", :value => tag_name, :name => "article[tag_list][]"))
    end

    content_tag(:ul, list_elements, :id => "tag_list")
  end
  
  def render_textile_design_guide
    TEXTILE_GUIDE.display
  end
  
  def saved_timestamp(article)
    if article.new_record?
      text = "No se ha guardado"
    else
      text = "Guardado: " + content_tag(:span, time_ago_in_words(article.updated_at, true))
    end
    return text.html_safe
  end
  
  def link_to_preview(article, options={})
    options = {:id => "preview" , :class => "smallbutton"}
    if article.new_record?
      options[:style] = "display: none;"
      link_path = "#"
    else
      link_path = article_path(article, :lightbox => true)
    end
    
    link_to t(:preview), link_path, options
  end
  
end
