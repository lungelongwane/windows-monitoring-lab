# Windows Domain Monitoring Lab

A hands-on Windows monitoring lab using **Prometheus**, **Grafana**, and **windows_exporter** to monitor a Windows domain environment.

## Background & Motivation

Having worked with infrastructure and systems support, I built this monitoring lab to strengthen my practical understanding of Windows infrastructure monitoring and performance visibility.

The lab focuses on monitoring a Windows Domain Controller and Windows client PC within the same `mydomain.com` environment using Prometheus and Grafana. It provides practical experience with Windows exporters, Prometheus scrape configuration, monitoring targets, metric collection, and Grafana dashboards for observing system health and performance.

## Actual lab environment

The lab was built around the **mydomain.com** Windows domain:

| System | Role | IP address | Domain |
|---|---|---:|---|
| Domain Controller | Windows Domain Controller | 172.16.0.1 | mydomain.com |
| User PC | Windows domain client/user PC | 172.16.0.11 | mydomain.com |

Prometheus was used to collect monitoring data from the Windows systems, and Grafana was used to visualise the collected metrics.

## Architecture

```
                         mydomain.com
                              |
                +-------------+-------------+
                |                           |
        Domain Controller              User PC
          172.16.0.1                  172.16.0.11
                |                           |
                +-------------+-------------+
                              |
                       Windows metrics
                              |
                         Prometheus
                              |
                           Grafana
```

The two Windows machines were part of the same domain and were monitored as separate systems. Exact exporter installation details, Prometheus host details, and historical port/configuration values are intentionally not stated here unless verified from the original lab configuration.

## What the project demonstrates

- Windows domain environment monitoring
- Monitoring of a Domain Controller and Windows client PC
- Prometheus metrics collection and querying
- Grafana dashboard visualisation
- Windows system health monitoring
- Troubleshooting and validation of a monitoring stack
- Configuration managed in Git for repeatability

## Repository layout

- `prometheus/prometheus.yml` - Prometheus scrape configuration
- `grafana/provisioning/` - Grafana datasource and dashboard provisioning
- `grafana/dashboards/` - dashboard definitions
- `scripts/health-check.ps1` - monitoring health checks
- `docs/` - architecture, setup, Prometheus, Grafana and troubleshooting documentation
- `screenshots/` - evidence from the actual lab can be stored here

## Monitoring flow

```
Windows Domain Controller (172.16.0.1)
                 \\
                  \\
                   > Prometheus --> Grafana
                  /
Windows User PC (172.16.0.11)
```

Prometheus is the metrics collection and time-series layer. Grafana provides the dashboard and visualisation layer.

## Evidence

The repository documents the actual lab topology supplied for this project. Screenshots of the Prometheus targets and Grafana dashboards should be added under `screenshots/` if available so the repository contains visual evidence of the implemented environment.

Do not commit passwords, API keys, tokens or other secrets.
