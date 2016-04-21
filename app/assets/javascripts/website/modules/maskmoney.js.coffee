Website.Maskmoney =
  init: ->
    unit = $('body').data('unit')
    separator = $('body').data('separator')
    delimiter = $('body').data('delimiter')
    $('.js-monetary').maskMoney({prefix: unit, allowNegative: false, thousands: delimiter, decimal: separator, affixesStay: true})

  modules: -> []
