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
    toggle_message($(this));
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

  $(".filter ul").hide();
  $(".filter ul li a.active").each(function(){
    $(this).parents("ul").show();
    $(this).parents('ul').prev().addClass('is-active');
  });
  $(".filter > h1").click(function() {
    $(this).next().slideToggle();
    $(this).toggleClass('is-active');
    return false;
  });
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
  if (form.html() !== null) {
    $.post(form.attr("action"), form.serialize(), null, "script");
  }
}

// Triggers a notification to the author when a comment is created
function disqus_config() {
  this.callbacks.onNewComment = [function() {
    var article_id = $("#article_id").text();
    $.get( create_notification_url(article_id), 
           function(data) {}, 
           'json');
  }];
}

function create_notification_url(article_id) {
  return "/articles/" +  article_id + "/notifications/deliver";
}

function toggle_message(select) {
  open_message  = "Mostrar guía de estilos";
  close_message = "Ocultar guía de estilos";

  if (select.text() == open_message) {
    select.text(close_message);
  } else {
    select.text(open_message);
  }
}
