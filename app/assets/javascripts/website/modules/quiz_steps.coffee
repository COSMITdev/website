Website.QuizSteps =
  init: ->
    $('input[name="quiz[q1]"]').on 'change', (e) ->
      $('.js-quiz-step-1').hide()
      $('.js-quiz-step-2').show()

    $('input[name="quiz[q2]"]').on 'change', (e) ->
      $('.js-quiz-step-2').hide()
      $('.js-quiz-step-3').show()

    $('input[name="quiz[q3]"]').on 'change', (e) ->
      $('.js-quiz-step-3').hide()
      $('.js-quiz-step-4').show()

    $('input[name="quiz[q4]"]').on 'change', (e) ->
      $('.js-quiz-step-4').hide()
      $('.js-quiz-step-5').show()

    $('input[name="quiz[q5]"]').on 'change', (e) ->
      $('.js-quiz-step-5').hide()
      $('.js-quiz-step-6').show()

  modules: -> []
