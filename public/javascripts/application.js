// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  
  $("a#add_tag").click(function(){
   input = $("input#tag")
   value = input.val();
   input.val("");
   $("ul#tag_list").append("<li><span>"+value+"</span><a href='#'>X</a>" +
                            "<input name='article[tag_list][]' type='hidden' value="+ value +"></li>")
   return false;
  })
  
  $("ul#tag_list li a").live("click", function(){
    $(this).parent().remove();
    return false;
  })
  
});