Website.ModalProtocamp =
  init: ->
    isMobile = window.matchMedia("only screen and (max-width: 760px)")

    # When mobile, show the modal when user Scroll down the page
    if isMobile.matches
      totalHeight = $(document).height() - $(window).height()

      $(window).scroll ->
        ninenthPercent = totalHeight*0.95
        actualPosition = $(window).scrollTop()

        if ninenthPercent < actualPosition
          showModal()

    # When desktop, show the modal when mouse leave the page
    else
      $("html").bind "mouseleave touchend", ->
        showModal()

    $(".closeModal").on "click", ->
      hideModal()

    $("html").click (e) ->
      if e.target.id == "modalFade"
        hideModal()

    setCookie = ->
      Cookies.set('closeModal', 'true', { expires: 0.1 })

    showModal = ->
      if Cookies.get('closeModal') == undefined
        $("#modalFade").show()
        setCookie()

    hideModal = ->
      $("#modalFade").hide()
      setCookie()

  modules: -> []
