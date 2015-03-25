# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
$(document).ready ->  
  $("#calendar").fullCalendar(
    eventSources: [
      {
        url: '/events.json',
        color: 'purple',
        textColor: 'white'
      }
    ]

    header:
      left: 'prevYear nextYear',
      center: 'title',
      right: 'today prev next'

    buttonText:
      prevYear: 'Previous Year'
      nextYear: 'Next Year'

    dayClick: ->
      $('#mTitle').html 
      $('#eventModal').modal()

    eventClick: (event, jsEvent, view) ->
      $('#modalTitle').html event.title
      $('#modalBody').html event.description
      $('#eventUrl').attr 'href', event.url
      $('#fullCalModal').modal()
     
  )

