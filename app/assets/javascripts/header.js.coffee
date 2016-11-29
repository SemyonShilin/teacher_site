$(document).ready ->
  $("span.menu").click ->
    $(".top-menu").slideToggle('slow')

  $('nav li a').each (e,i) ->
    href = window.location.href
    if (href.indexOf($(this).attr('href')) >= 0)
      $('nav li a').removeClass('active')
      $(this).addClass('active')
