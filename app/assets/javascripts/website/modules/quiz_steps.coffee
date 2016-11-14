Website.QuizSteps =
  init: ->
    $('input[name="quiz[q1]"]').on 'change', (e) ->
      $('.js-quiz-step-1').hide()
      $('.js-quiz-step-2').show()
      $('.js-progress-quiz').width('12.5%');

    $('input[name="quiz[q2]"]').on 'change', (e) ->
      $('.js-quiz-step-2').hide()
      $('.js-quiz-step-3').show()
      $('.js-progress-quiz').width('25%');

    $('input[name="quiz[q3]"]').on 'change', (e) ->
      $('.js-quiz-step-3').hide()
      $('.js-quiz-step-4').show()
      $('.js-progress-quiz').width('37.5%');

    $('input[name="quiz[q4]"]').on 'change', (e) ->
      $('.js-quiz-step-4').hide()
      $('.js-quiz-step-5').show()
      $('.js-progress-quiz').width('50%');

    $('input[name="quiz[q5]"]').on 'change', (e) ->
      $('.js-quiz-step-5').hide()
      $('.js-quiz-step-6').show()
      $('.js-progress-quiz').width('62.5%');

    $('input[name="quiz[q6]"]').on 'change', (e) ->
      $('.js-quiz-step-6').hide()
      $('.js-quiz-step-7').show()
      $('.js-progress-quiz').width('75%');

    $('input[name="quiz[q7]"]').on 'change', (e) ->
      $('.js-quiz-step-7').hide()
      $('.js-quiz-step-8').show()
      $('.js-progress-quiz').width('87.5%');

  modules: -> []
