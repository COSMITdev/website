Website.ModalProtoCamp =
  init: ->
    $("html").bind "mouseleave touchend", ->
      # if false, show the modal and set cookie
      unless isCookiePresent()
        $("#modalFade").show()
        setCookie()

    $(".closeModal").on "click", ->
      $("#modalFade").hide()
      setCookie()

    $("html").click (e) ->
      if e.target.id == "modalFade"
        $("#modalFade").hide()
        setCookie()

    isCookiePresent = ->
      if document.cookie.indexOf('modal') >= 0 then true else false

    setCookie = ->
      expiry = new Date
      expiry.setTime(expiry.getTime() + 60 * 60 * 12 * 1000) # Set to 12 hours
      # Date()'s toGMTSting() method will format the date correctly for a cookie
      document.cookie = 'modal=yes; expires=' + expiry.toGMTString()

  modules: -> []
