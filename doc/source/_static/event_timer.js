/* Licensed under the Apache License, Version 2.0
 */
var event_date;

function startTime() {
    var delta = parseInt(event_date - (new Date).getTime() / 1000);
    var days = parseInt(delta / (3600 * 24));
    var hours = parseInt(delta / 3600) % 24;
    var minutes = parseInt( delta / 60 ) % 60;
    var seconds = delta % 60;
    document.getElementById('eventtimer').innerHTML = days+'d '+hours+'h '+minutes+'m '+seconds+'s';
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
    var next_events = []
    var current_events = []
    var next_event_end
    for (i = 0; i < events_timeline.length; i++) {
        var current_event = events_timeline[i];
        var current_event_start = Date.parse(current_event.start + "Z") / 1000;
        var current_event_end = Date.parse(current_event.end + "Z") / 1000;
        if (now > current_event_end) {
            set_event_status(current_event.name, 'Past');
        }
        else if (now >= current_event_start && now < current_event_end) {
            set_event_status(current_event.name, 'Current');
            if (next_event_end == undefined) {
                next_event_end = current_event_end;
            }
            current_events.push(current_event.name)
            event_date = current_event_end
            startTime();
        }
        else if (now < current_event_start &&
                (next_event_end == undefined || current_event_end <= next_event_end)) {
            set_event_status(current_event.name, 'Next');
            if (next_event_end == undefined) {
                next_event_end = current_event_end;
            }
            next_events.push(current_event.name)
            event_date = current_event_start
            startTime();
        }
        else if (now < current_event_start && current_event_end > next_event_end) {
            set_event_status(current_event.name, 'Future');
        }
    }

    // Set the countdown timer based on any active or upcoming events
    if (current_events.length > 0) {
        document.getElementById('eventname').innerHTML = current_events.join(" and ") + ' end in';
    }
    else if (next_events.length > 0) {
        document.getElementById('eventname').innerHTML = next_events.join(" and ") + ' start in';
    }
}
window.onload = function () { setup_timeline() }
