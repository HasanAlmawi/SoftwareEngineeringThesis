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
        textColor: 'white',
        borderColor: 'black'
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
      hash = 5381
      i = 0
      while i < event.faculty.length
        hash = (hash << 5) + hash + event.faculty.charCodeAt(i)
        i++
      r = (hash & 0xFF0000) >> 16
      g = (hash & 0x00FF00) >> 8
      b = hash & 0x0000FF
      element.css('background-color', "#" + ("0" + r.toString(16)).substr(-2) + ("0" + g.toString(16)).substr(-2) + ("0" + b.toString(16)).substr(-2));
      element.attr 'href', 'javascript:void(0);'
      element.click ->
        $('#eventCode').html event.code
        $('#speaker').html event.lecturer
        $('#departmentEvent').html event.faculty
        $('#modalTitle').html event.title
        $('#modalBody').html event.description
        $('#startTime').html moment(event.start).format('MMM Do h:mm A')
        $('#endTime').html moment(event.end).format('MMM Do h:mm A')
        $('#eventUrl').attr 'href', event.url
        $('#fullCalModal').modal()
     
  )

