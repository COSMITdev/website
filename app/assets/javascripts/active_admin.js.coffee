#= require active_admin/base

$(window).load ->
  textarea   = $('#post_body')[0]
  container  = $('#post_body_input')[0]
  wordCounts = {}

  $(container).append("<div id='post_body_counter' class='text-right'>
                         <span>Total words:
                           <span class='js-word-counter'>
                             0
                           </span>
                         </span>
                       </div>")

  $('#post_body').keyup(->
    matches         = @value.match(/\b/g)
    finalCount      = 0
    wordCounts[@id] = if matches then matches.length / 2 else 0

    $.each wordCounts, (key, value) ->
      finalCount += value
    $('.js-word-counter').text finalCount
  ).keyup()
