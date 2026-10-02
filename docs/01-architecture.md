# Architecture

## Lab topology

The monitoring lab was implemented in a Windows domain environment named **mydomain.com**.

| System | Role | IP address |
|---|---|---:|
| DC | Domain Controller | 172.16.0.1 |
| User PC | Windows domain client | 172.16.0.11 |

Both Windows systems belonged to the same domain and were monitored through the Prometheus/Grafana monitoring stack.

## Data flow

```
Domain Controller (172.16.0.1) --+
                                  +--> Prometheus --> Grafana
User PC (172.16.0.11) -----------+
```

The Windows hosts expose system metrics through the Windows metrics exporter used in the lab. Prometheus collects those metrics, stores the time series and makes them available for PromQL queries. Grafana queries Prometheus and presents the results as dashboards.

## Roles of the components

### Domain Controller

The Domain Controller provided the Windows domain environment and was one of the monitored systems.

### User PC

The Windows user PC was joined to **mydomain.com** and was monitored as the client endpoint.

### Prometheus

Prometheus collected time-series metrics from the Windows systems.

### Grafana

Grafana provided dashboards for visualising the monitoring data.

## Configuration accuracy

The IP addresses and domain name above reflect the lab details supplied for this repository. Exporter port, hostnames and Prometheus/Grafana installation location should only be documented as exact historical values when confirmed from the original configuration.
