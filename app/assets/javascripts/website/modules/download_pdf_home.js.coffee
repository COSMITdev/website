Website.DownloadPDFHome =
  init: ->
    $('.js-download-pdf-services').click ->
      ga('send', 'event', 'Documentos', 'download', 'Download PDF Serviços')
