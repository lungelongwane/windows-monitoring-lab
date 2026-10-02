# Setup

## 1. Windows exporter

Install windows_exporter on the Windows machine being monitored. Confirm that its metrics endpoint is reachable:

```text
http://localhost:9182/metrics
```

The exact installer and collector selection should follow the version you install. Avoid hard-coding an installer URL in this repository because release URLs and versions change.

## 2. Start Prometheus and Grafana

From the repository root:

```powershell
docker compose up -d
```

Check containers:

```powershell
docker compose ps
```

## 3. Validate Prometheus

Open Prometheus and go to **Status > Targets**.

The `windows` target should be listed as UP.

## 4. Validate Grafana

Open Grafana and confirm the Prometheus datasource is provisioned. The Windows Monitoring dashboard should be available in the Windows Monitoring folder.

## 5. Separate VM/server

If the exporter runs on another Windows VM or server, edit `prometheus/prometheus.yml` and replace `host.docker.internal:9182` with the reachable hostname or IP address.

Ensure Windows Firewall permits the exporter port from the Prometheus host.
