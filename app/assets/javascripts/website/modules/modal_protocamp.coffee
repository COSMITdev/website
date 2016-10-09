Website.ModalProtocamp =
  init: ->
    $("html").bind "mouseleave touchend", ->
      # if false, show the modal and set cookie
      unless Cookies.get('closeModal') == 'true'
        $("#modalFade").show()
        setCookie()

    $(".closeModal").on "click", ->
      $("#modalFade").hide()
      setCookie()

    $("html").click (e) ->
      if e.target.id == "modalFade"
        $("#modalFade").hide()
        setCookie()

    setCookie = ->
      # the integer is in days
      Cookies.set('closeModal', 'true', { expires: 1 })

  modules: -> []
