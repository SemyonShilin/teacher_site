$(document).ready ->
  $('.templatemo-sidebar-menu li.sub a').click ->
    if $(this).parent().hasClass('open')
      $(this).parent().removeClass('open')
    else
      $(this).parent().addClass('open')
