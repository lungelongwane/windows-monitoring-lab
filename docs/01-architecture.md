# Architecture

The lab separates metric collection, storage/querying and visualisation.

## Components

### windows_exporter

Runs on the Windows machine and exposes Windows performance and system metrics over HTTP, normally on TCP 9182.

### Prometheus

Prometheus periodically scrapes the exporter endpoint and stores the resulting time-series data.

### Grafana

Grafana queries Prometheus and presents the metrics as dashboards.

## Data flow

```text
Windows OS
  -> windows_exporter
  -> Prometheus
  -> Grafana
```

The design can be extended to multiple Windows machines by adding additional Prometheus targets.
