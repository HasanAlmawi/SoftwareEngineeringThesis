# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
$(document).ready ->  
  $("#calendar").fullCalendar(
    events: '/events.json'

    header:
      left: 'prevYear nextYear',
      center: 'title',
      right: 'today prev next'

    buttonText:
      prevYear: 'Previous Year'
      nextYear: 'Next Year'

    dayClick: ->
      alert 'Day clicked!'

    eventClick: (event, jsEvent, view) ->
      $('#modalTitle').html event.title
      $('#modalBody').html event.description
      $('#eventUrl').attr 'href', event.url
      $('#fullCalModal').modal()
     
  )

