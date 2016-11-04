Website.QuizSteps =
  init: ->
    $('input[name="quiz[q1]"]').on 'change', (e) ->
      $('.js-quiz-step-1').hide()
      $('.js-quiz-step-2').show()
      $('.js-progress-quiz').width('20%');

    $('input[name="quiz[q2]"]').on 'change', (e) ->
      $('.js-quiz-step-2').hide()
      $('.js-quiz-step-3').show()
      $('.js-progress-quiz').width('40%');

    $('input[name="quiz[q3]"]').on 'change', (e) ->
      $('.js-quiz-step-3').hide()
      $('.js-quiz-step-4').show()
      $('.js-progress-quiz').width('60%');

    $('input[name="quiz[q4]"]').on 'change', (e) ->
      $('.js-quiz-step-4').hide()
      $('.js-quiz-step-5').show()
      $('.js-progress-quiz').width('80%');

    $('input[name="quiz[q5]"]').on 'change', (e) ->
      $('.js-quiz-step-5').hide()
      $('.js-quiz-step-6').show()
      $('.js-progress-quiz').width('100%');

  modules: -> []
