// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
timer_is_on = 0

  
$(function(){
 
  $("a#add_tag").click(function(){
   input = $("input#tag")
   value = input.val();
   input.val("");
   $("ul#tag_list").append("<li><span>"+value+"</span><a href='#'>X</a>" +
                            "<input name='article[tag_list][]' type='hidden' value="+ value +"></li>")
   call_save_article()
   return false;
  })
  
  $("ul#tag_list li a").live("click", function(){
    $(this).parent().remove();
    call_save_article()
    return false;
  })

  $('a#toggle').click(function() {
    $('#togglebox').toggle(400);
    return false;
  });
  
  
  $("#article_name, #article_description, #article_content").blur(function(){
	  if ($(this).val().length != 0){
      call_save_article()
    }
  });
  
  $("a#preview").click(function(){
    var form = $("form#article_form");
    $.post(form.attr("action"), form.serialize(), function(data){
      $.fancybox({
    		'width'			: '90%',
    		'height'		: '90%',
    		'titleShow'		: false,
    		'transitionIn'	: 'elastic',
    		'transitionOut'	: 'elastic',
    		'type'			: 'iframe',
    		'href'      : $("a#preview").attr("href")
    	})
    }, "script");
    return false;
  });
  
  $("#article_category_id").change(function(){
      call_save_article()
  });
<<<<<<< HEAD

  $('a#preview').click(function() {
    var form = $("form#article_form");
	$.post(form.attr("action"), form.serialize(), null, "script");
    
  });
  
  $("a#preview").fancybox({
		'width'			: '90%',
		'height'		: '90%',
		'titleShow'		: false,
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic',
		'type'			: 'iframe',
		'onStart'   : update_article()
	});
=======
>>>>>>> d9a213356f19908ac6529ca8b73c8bb76403663c
});

function save_article(){
  var form = $("form#article_form");
  var new_form = (form.attr("action") == "/articles");
  
  if (new_form == true){
    $.post(form.attr("action"), form.serialize(), null, "script")
    setTimeout("save_article()", 60000);
  } else {
    $.post(form.attr("action"), form.serialize(), null, "script");
    setTimeout("save_article()", 60000);
  }
}

function call_save_article(){
  if (timer_is_on == 0){
    timer_is_on = 1;
    save_article();
  }
}

function update_article(){
  var form = $("form#article_form");
  $.post(form.attr("action"), form.serialize(), null, "script");
}