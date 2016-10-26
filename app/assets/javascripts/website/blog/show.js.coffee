Website.Blog ?= {}

Website.Blog.Show =
  init: ->
    # Fire after 30 seconds
    setTimeout(->
      fbq 'trackCustom', 'Page View 30s',
        content_url: window.location.href
        content_type: 'Post'
    , 30000)

   modules: -> []
