Website.ModalProtoCamp =
  init: ->
    $("html").bind "mouseleave touchend", ->
      $("#modalFade").show()

    $(".close").on "click", ->
      $("#modalFade").hide()

    $("html").click (e) ->
      if e.target.id == "modalFade"
        $("#modalFade").hide()

  modules: -> []
