# Troubleshooting

Use this sequence instead of changing several components at once.

## 1. Exporter

From the Windows machine:

```powershell
Invoke-WebRequest http://localhost:9182/metrics
```

If this fails, fix windows_exporter first.

## 2. Network path

If Prometheus runs in Docker and the exporter runs on Windows, confirm the configured target is reachable from the Docker environment.

For Docker Desktop on the same Windows host, the default target is `host.docker.internal:9182`.

For a separate VM/server, use its reachable DNS name or IP.

## 3. Prometheus

Open **Status > Targets**.

- **UP**: Prometheus can scrape the exporter.
- **DOWN**: inspect the target error shown by Prometheus.

## 4. Grafana

If Prometheus is UP but Grafana panels are empty:

1. Confirm the Prometheus datasource is healthy.
2. Run the query directly in Prometheus.
3. Confirm the metric name exists.
4. Check the selected dashboard time range.

## 5. Windows firewall

For a remote monitoring setup, Windows Firewall must allow the exporter port from the Prometheus host. Keep the rule scoped to the monitoring network rather than opening the port broadly.

## 6. Evidence

When troubleshooting is complete, capture the actual result in a screenshot and add it to `screenshots/` with a short description in the README.
