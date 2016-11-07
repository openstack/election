/* Licensed under the Apache License, Version 2.0
 */
var event_date;
var now = parseInt((new Date).getTime() / 1000);

function startTime() {
    var delta = parseInt(event_date - (new Date).getTime() / 1000);
    var days = parseInt(delta / (3600 * 24));
    var hours = parseInt(delta / 3600) % 24;
    var minutes = parseInt( delta / 60 ) % 60;
    var seconds = delta % 60;
    document.getElementById('eventtimer').innerHTML = days+'d'+hours+'h'+minutes+'m'+seconds+'s';
    var t = setTimeout(startTime, 500);
}

function setup_timeline() {
    for (i = 0; i < events_timeline.length; i++) {
        var current_event = events_timeline[i];
        event_date = Date.parse(current_event.start) / 1000;
        if (event_date > now) {
            document.getElementById('eventname').innerHTML = current_event.name+' starts in';
            startTime();
            break;
        }
        event_date = Date.parse(current_event.end) / 1000;
        if (event_date > now) {
            document.getElementById('eventname').innerHTML = current_event.name+' ends in';
            startTime();
            break;
        }
    }
}
$(document).ready(setup_timeline);
