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
    list_elements += content_tag(:li,"* => enclose text between asterisks to get a bold text * bold text *")
    list_elements += content_tag(:li,"_ => enclose text between underscores to get an Italic text * Italic text *")
    list_elements += content_tag(:li,"- => enclose text between hypens to get a strikethrough text - strikethrough text -")
    list_elements += content_tag(:li," + => enclose text between plus signs to get a underlined text * underlined text *")
    list_elements += content_tag(:li," %{color:red} => enclose text between percentage signs and indicate the color between brackets to get a colored text %{color:red} red text %")
    content_tag(:ul, list_elements, :id => "textileGuide")
  end
  
end
