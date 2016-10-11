Website.ModalProtocamp =
  init: ->
    isMobile = window.matchMedia("only screen and (max-width: 760px)")

    # When mobile, show the modal when user Scroll down the page
    if isMobile.matches
      bottom = $(document).height() - $(window).height()

      $(window).scroll ->
        if $(window).scrollTop() < bottom then showModal()

    # When desktop, show the modal when mouse leave the page
    else
      $("html").bind "mouseleave touchend", ->
        showModal()

    $(".closeModal").on "click", ->
      hideModal()

    $("html").click (e) ->
      if e.target.id == "modalFade" then hideModal()

    setCookie = ->
      Cookies.set('closeModal', 'true', { expires: 1 })

    showModal = ->
      if Cookies.get('closeModal') == undefined
        $("#modalFade").show()
        setCookie()

    hideModal = ->
      $("#modalFade").hide()
      setCookie()

  modules: -> []
