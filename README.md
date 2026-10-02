# Windows Monitoring Lab

A practical monitoring lab for Windows systems using **Prometheus**, **Grafana**, and **windows_exporter**.

## Lab goals

- Collect Windows host metrics with windows_exporter.
- Scrape metrics with Prometheus.
- Visualise system health in Grafana.
- Monitor CPU, memory, disk, network, uptime and selected Windows services.
- Provide repeatable validation and troubleshooting steps.

> **Evidence note:** This repository contains the lab configuration, scripts and documentation. A configuration file is not proof that a monitoring stack has been executed successfully on a live system. Add your own screenshots and observed results under `screenshots/` after running the lab.

## Architecture

```text
Windows Server / DC / PC
        |
        | :9182
        v
windows_exporter
        |
        | Prometheus scrape
        v
Prometheus :9090
        |
        | PromQL
        v
Grafana :3000
```

## Repository layout

- `prometheus/prometheus.yml` - Prometheus scrape configuration
- `grafana/provisioning/` - Grafana datasource provisioning
- `grafana/dashboards/` - starter dashboard definition
- `scripts/health-check.ps1` - Windows-side connectivity checks
- `docs/` - architecture, setup and troubleshooting notes
- `screenshots/` - add screenshots from your own running lab

## Prerequisites

- Windows Server or Windows client for the monitored host
- windows_exporter installed and listening on TCP 9182
- Docker Desktop (or another Docker-compatible runtime) for Prometheus and Grafana
- Network access from the Prometheus container to the Windows host

## Quick start

1. Install and start windows_exporter on the Windows host.
2. Run `scripts/health-check.ps1` on that host.
3. Confirm `http://localhost:9182/metrics` returns metrics.
4. Start the monitoring stack:

```powershell
docker compose up -d
```

5. Open Prometheus at `http://localhost:9090`.
6. Check **Status > Targets** and confirm the Windows target is UP.
7. Open Grafana at `http://localhost:3000`.
8. Open the provisioned Windows Monitoring dashboard.

## Configuration

The default Prometheus target is `host.docker.internal:9182`, which is suitable when Docker Desktop runs on the same Windows machine as windows_exporter.

For a separate Windows VM/server, replace the target in `prometheus/prometheus.yml` with the monitored machine's DNS name or IP address.

Do not commit passwords, API keys, tokens or other secrets.

## Portfolio evidence

After running the lab, add screenshots showing:

1. windows_exporter metrics endpoint
2. Prometheus target status
3. Grafana dashboard with live Windows metrics
4. One troubleshooting or validation result

This keeps the repository honest: the configuration is version-controlled, while screenshots demonstrate what was actually observed.
