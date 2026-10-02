# Setup

## Lab environment

The implemented environment consisted of:

- Windows Domain Controller: `172.16.0.1`
- Windows user PC: `172.16.0.11`
- Windows domain: `mydomain.com`
- Prometheus for metric collection
- Grafana for visualisation
- A Windows metrics exporter on the monitored systems

## Monitoring targets

Prometheus must be able to reach the exporter endpoint on both Windows systems.

The repository's current Prometheus configuration uses `172.16.0.1:9182` and `172.16.0.11:9182` as exporter targets. If the original lab used a different exporter port, update the configuration to match the original environment rather than assuming the port.

## Validation

1. Confirm the Domain Controller is reachable at `172.16.0.1`.
2. Confirm the user PC is reachable at `172.16.0.11`.
3. Confirm the Windows metrics exporter is running on both systems.
4. Confirm Prometheus can scrape both targets.
5. Check **Status > Targets** in Prometheus and verify the targets are healthy.
6. Open Grafana and verify the Prometheus datasource and Windows monitoring dashboard.

## Network considerations

Both systems need to be reachable from the Prometheus host. Windows Firewall rules must allow the exporter traffic required by the monitoring configuration.

## Security

Do not store domain passwords, exporter credentials, API tokens or other secrets in the repository.
