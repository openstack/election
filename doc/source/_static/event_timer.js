/* Licensed under the Apache License, Version 2.0
 */
var event_date;
var now = parseInt((new Date).getTime() / 1000)
function startTime() {
    var delta = parseInt(event_date - (new Date).getTime() / 1000)
    var hours = parseInt(delta / 3600)
    var minutes = parseInt( delta / 60 ) % 60
    var seconds = delta % 60
    document.getElementById('eventtimer').innerHTML = hours+'h'+minutes+'m'+seconds+'s'
    var t = setTimeout(startTime, 500)
}
function setup_timeline() {
    for (i = 0; i < events_timeline.length; i++) {
        var current_event = events_timeline[i];
        event_date = Date.parse(current_event.date) / 1000
        if (event_date > now) {
            document.getElementById('eventname').innerHTML = 'Next event is '+current_event.name+' in'
            event_date = Date.parse(current_event.date) / 1000
            startTime(current_event.date)
            break
        }
    }
}
$(document).ready(setup_timeline)
