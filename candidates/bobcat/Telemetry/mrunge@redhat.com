Hi OpenStack Telemetry folks,

I'm volunteering to keep the lights on with the Telemetry project.

Over the last cycle, we achieved

- get more data added to ceilometer, e.g to expose names of projects, 
  machines, etc. in addition to UUIDs. That will help with the usability
  of dashboards at the end.
- get a replacement for the ceilometer data export to prometheus to fix
  remaining issues.
- autoscaling was updated/fixed so that it uses aggregates in gnocchi.

Looking forward, there is a bit of cleanup to be done.

Thanks you.
Matthias
