# Grafana

Grafana is used as the visualisation layer for the lab.

## Provisioning

The repository provisions:

- a Prometheus datasource
- a Windows Monitoring dashboard provider
- a starter Windows dashboard

This makes the dashboard configuration reproducible instead of requiring every panel to be created manually.

## Dashboard scope

The starter dashboard focuses on:

- CPU usage
- available memory
- disk free space
- system uptime

The dashboard can be expanded with network throughput, service state and alerting panels after those metrics are confirmed on the monitored host.

## Important

Dashboard panels depend on the metric names exposed by the installed windows_exporter version and enabled collectors. If a panel is empty, verify the metric exists in the exporter endpoint and Prometheus before changing the Grafana query.
