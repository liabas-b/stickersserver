
$(function() {

  $('.link-icon').hover(function(){
    $(this).addClass('active');
    $('.link-icon.active i').addClass('icon-white');
    return false;
  },function(){
    $('.link-icon.active i').removeClass('icon-white');
    $(this).removeClass('active');
    return false;
  });

  $('#resizable-map .resize-button').click(function(){
    $('#resizable-map').toggleClass('expanded');
  });

  $('.well').hover(function(){
    $(this).addClass('active');
    return false;
  }, function(){
    $(this).removeClass('active');
    return false;
  });

  $('#sidebar-nav li a').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 1000);
    $('#sidebar-nav li a').removeClass('active');
    $(this).toggleClass('active');
    return false;
  });

  $(".pagination ul > li > a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#form_search input").keyup(function() {
    $.get($("#form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
    console.log(this.parentNode.parentNode.id);
    return false;
  });
  $("#followed_form_search input").keyup(function() {
    $.get($("#followed_form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
    console.log(this.parentNode.parentNode.id);
    return false;
  });

  var columnselectmenu = document.getElementById("column")
  if (columnselectmenu != null)
    columnselectmenu.onchange=(function() {
      console.log("select column changed");
      $.get($("#form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });
  var sortselectmenu = document.getElementById("search_sort")
  if (sortselectmenu != null)
    sortselectmenu.onchange=(function() {
      console.log("select sort changed");
      $.get($("#form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });
  var directionselectmenu = document.getElementById("search_direction")
  if (directionselectmenu != null)
    directionselectmenu.onchange=(function() {
      console.log("select direction changed");
      $.get($("#form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });

  var fcolumnselectmenu = document.getElementById("followed_column")
  if (fcolumnselectmenu != null)
    fcolumnselectmenu.onchange=(function() {
      console.log("followed select column changed");
      $.get($("#followed_form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });
  var fsortselectmenu = document.getElementById("followed_search_sort")
  if (fsortselectmenu != null)
    fsortselectmenu.onchange=(function() {
      console.log("followed select sort changed");
      $.get($("#followed_form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });
  var fdirectionselectmenu = document.getElementById("followed_search_direction")
  if (fdirectionselectmenu != null)
    fdirectionselectmenu.onchange=(function() {
      console.log("followed select direction changed");
      $.get($("#followed_form_search").attr("action"), $("#form_search").serialize() + '&' + $("#followed_form_search").serialize(), null, "script");
      return false;
    });
});
