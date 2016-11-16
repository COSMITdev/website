Website.QuizSteps =
  init: ->
    $('input[name="quiz[q1]"]').on 'change', (e) ->
      $('.js-quiz-step-1').hide()
      $('.js-quiz-step-2').show()
      $('.js-progress-quiz').width('16.66%');

    $('input[name="quiz[q2]"]').on 'change', (e) ->
      $('.js-quiz-step-2').hide()
      $('.js-quiz-step-3').show()
      $('.js-progress-quiz').width('33.32%');

    $('input[name="quiz[q3]"]').on 'change', (e) ->
      $('.js-quiz-step-3').hide()
      $('.js-quiz-step-4').show()
      $('.js-progress-quiz').width('49.98%');

    $('input[name="quiz[q4]"]').on 'change', (e) ->
      $('.js-quiz-step-4').hide()
      $('.js-quiz-step-5').show()
      $('.js-progress-quiz').width('66.64%');

    $('input[name="quiz[q5]"]').on 'change', (e) ->
      $('.js-quiz-step-5').hide()
      $('.js-quiz-step-6').show()
      $('.js-progress-quiz').width('83.3%');

    $('input[name="quiz[q6]"]').on 'change', (e) ->
      $('.js-quiz-step-6').hide()
      $('.js-quiz-step-7').show()
      $('.js-progress-quiz').width('100%');

  modules: -> []
