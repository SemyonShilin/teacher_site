$(document).on 'click', '.show-block', ->
  $('#hide-block').slideToggle('slow')
  $(this).toggleClass('active')
  return false