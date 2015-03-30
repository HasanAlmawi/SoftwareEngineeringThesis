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
        borderColor: 'purple',
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
    

    eventRender: (event, element) ->
      element.attr 'href', 'javascript:void(0);'
      element.click ->
        $('#eventCode').html event.code
        $('#speaker').html event.lecturer
        $('#facEvent').html event.faculty
        $('#modalTitle').html event.title
        $('#modalBody').html event.description
        $('#startTime').html moment(event.start).format('MMM Do h:mm A')
        $('#endTime').html moment(event.end).format('MMM Do h:mm A')
        $('#eventUrl').attr 'href', event.url
        $('#fullCalModal').modal()
     
  )

