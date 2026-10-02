# Grafana

Grafana was used as the visualisation layer for the **mydomain.com** Windows monitoring lab.

## Dashboard purpose

The dashboards provide a visual view of the Windows systems monitored through Prometheus, including system health information available from the enabled Windows exporter collectors.

The two key monitored systems are:

- Domain Controller — `172.16.0.1`
- User PC — `172.16.0.11`

## Recommended dashboard views

The dashboard can be organised by the `role` and `host` labels in Prometheus so the Domain Controller and user PC can be viewed separately.

Typical Windows monitoring views include CPU, memory, disk, network, uptime and other exporter-provided system metrics. Only metrics confirmed to exist in the installed exporter should be used in production dashboard panels.

## Troubleshooting an empty panel

1. Check the Prometheus target is UP.
2. Query the relevant metric directly in Prometheus.
3. Confirm the metric exists on the exporter endpoint.
4. Check that the Grafana datasource points to Prometheus.
5. Check the dashboard query and labels.

This order isolates exporter, Prometheus and Grafana problems instead of changing dashboard queries blindly.
