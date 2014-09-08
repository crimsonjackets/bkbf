$ ->
  $(document).ready ->
    $('.but').click ->
      v = $(@).val()-1
      $('.line').animate
        left: -1051*v
      , 200
      $(@).parents('.buttons').find('.active').removeClass('active')
      $(@).addClass 'active'
    $('.full-block .base *').css
      'line-height': ''