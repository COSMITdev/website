Website.DownloadPDFHome =
  init: ->
    $('.js-download-pdf-protocamp').click ->
      ga('send', 'event', 'Documentos', 'download', 'Download PDF Protocamp')
