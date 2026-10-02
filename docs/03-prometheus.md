# Prometheus

Prometheus was used as the metrics collection and time-series database component of the **mydomain.com** monitoring lab.

## Configured Windows targets

The lab contains two Windows monitoring targets:

| Target | Role | Domain |
|---|---|---|
| `172.16.0.1:9182` | Domain Controller | mydomain.com |
| `172.16.0.11:9182` | User PC | mydomain.com |

The exporter port shown here is the current repository configuration. Verify it against the original lab if exact historical configuration is required.

## Target validation

Use **Status > Targets** in Prometheus to confirm that both Windows endpoints are being scraped successfully.

Useful checks include:

- target state
- scrape health
- last scrape time
- scrape errors
- available Windows metrics

## PromQL

The exact metric names depend on the Windows exporter version and collectors enabled in the original lab. Query the Prometheus expression browser or exporter endpoint to confirm the available metrics before building additional dashboard panels.

## Scaling

The configuration uses labels to distinguish the Domain Controller from the user PC. Additional Windows domain systems can be added as separate targets while retaining the same monitoring job.
