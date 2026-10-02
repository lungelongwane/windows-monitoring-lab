# Prometheus

Prometheus is responsible for scraping and querying the metrics exposed by windows_exporter.

## Scrape configuration

The repository uses a dedicated `windows` scrape job. The default target is:

```text
host.docker.internal:9182
```

This assumes Prometheus runs in Docker Desktop on the same Windows host as the exporter.

## Validation

Use the Prometheus web interface:

- **Status > Targets** to verify target health.
- **Graph** to query metrics.
- Query the exporter data before troubleshooting Grafana.

Example query:

```promql
windows_memory_available_bytes
```

## Scaling

For multiple Windows machines, add targets under the same job or create separate jobs with meaningful labels such as environment, role and hostname.
