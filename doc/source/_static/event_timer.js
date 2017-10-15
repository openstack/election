/* Licensed under the Apache License, Version 2.0
 */
var event_date;

function startTime() {
    var delta = parseInt(event_date - (new Date).getTime() / 1000);
    var days = parseInt(delta / (3600 * 24));
    var hours = parseInt(delta / 3600) % 24;
    var minutes = parseInt( delta / 60 ) % 60;
    var seconds = delta % 60;
    document.getElementById('eventtimer').innerHTML = days+'d'+hours+'h'+minutes+'m'+seconds+'s';
    var t = setTimeout(startTime, 500);
}

function set_event_status(event_name, event_status) {
    var td = $("td:contains('"+event_name+"')");
    if (event_status == 'Next' || event_status == 'Current') {
        td.css("font-weight", "bold")
    }
    td.next().next().next().html(event_status);
}

function setup_timeline() {
    var now = parseInt((new Date).getTime() / 1000);
    for (i = 0; i < events_timeline.length; i++) {
        var current_event = events_timeline[i];
        var current_event_start = Date.parse(current_event.start + "Z") / 1000;
        var current_event_end = Date.parse(current_event.end + "Z") / 1000;
        if (now > current_event_end) {
            set_event_status(current_event.name, 'Past');
        }
        else if (event_date == undefined && now < current_event_start) {
            document.getElementById('eventname').innerHTML = current_event.name+' starts in';
            set_event_status(current_event.name, 'Next');
            event_date = current_event_start;
            startTime();
        }
        else if (event_date == undefined && now < current_event_end) {
            document.getElementById('eventname').innerHTML = current_event.name+' ends in';
            set_event_status(current_event.name, 'Current');
            event_date = current_event_end;
            startTime();
        }
        else if (now < current_event_start) {
            set_event_status(current_event.name, 'Future');
        }
    }
}
$(document).ready(setup_timeline);
