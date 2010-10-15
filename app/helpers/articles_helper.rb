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
    list_elements = "".html_safe
    list_elements += content_tag(:li,"* => enclose text between asterisks to get a bold text *bold text*")
    list_elements += content_tag(:li,"_ => enclose text between underscores to get an Italic text  _Italic text_")
    list_elements += content_tag(:li,"- => enclose text between hypens to get a strikethrough text -strikethrough text-")
    list_elements += content_tag(:li," + => enclose text between plus signs to get a underlined text +underlined text+")
    list_elements += content_tag(:li," %{color:red} => enclose text between percentage signs and indicate the color between brackets to get a colored text %{color:red} red text %")
    list_elements += content_tag(:li,"* bulleted list ")
    list_elements += content_tag(:li,"** 2-level bulleted list ")

    content_tag(:ul, list_elements, :id => "textileGuide")
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
      link_path = article_path(article)
    end
    
    link_to t(:preview), link_path, options
  end
  
end
