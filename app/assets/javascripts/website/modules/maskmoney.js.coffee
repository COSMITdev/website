Website.Maskmoney =
  init: ->
    $('.js-monetary').maskMoney({prefix: 'R$ ', allowNegative: false, thousands:'.', decimal:',', affixesStay: true})

  modules: -> []
