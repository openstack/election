Hi there,

I have been looking at/over Telemetry and its patches for the past couple of releases with and without
being the PTL.

Over the last cycle, the team worked on aetos, a component to enforce multitenancy for metrics stored
in prometheus. The python-observabilityclient learned to use the connection through aetos instead of
directly connecting to prometheus.

For the next cycle, I'd like to see actually telemetry data exposed e.g in horizon through grian ui;
there are components like watcher, which are querying metrics from prometheus. They would need a way
to integrate with aetos.

Thank you for considering me,
Matthias
