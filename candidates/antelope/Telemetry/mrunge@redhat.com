Hi OpenStack Telemetry folks,

I'm volunteering to keep the lights on with the Telemetry project.

Beyond that, I have plans to 

- get more data added to ceilometer, e.g to expose names of projects, 
  machines, etc. in addition to UUIDs. That will help with the usability
  of dashboards at the end.
- get a replacement for the ceilometer data export to prometheus to fix
  remaining issues.
- I'd like to conduct a couple of sessions during the PTG week on 
  enhancements and also on CI.
- finally, (and most important): get more contributors to the Telemetry
  project.

Thanks you.
Matthias
