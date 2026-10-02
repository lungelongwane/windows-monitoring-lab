[CmdletBinding()]
param(
    [string]$ExporterUrl = "http://localhost:9182/metrics",
    [string]$PrometheusUrl = "http://localhost:9090/-/ready"
)

$ErrorActionPreference = "Stop"

Write-Host "Windows Monitoring Lab health check" -ForegroundColor Cyan

try {
    $response = Invoke-WebRequest -Uri $ExporterUrl -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "[OK] windows_exporter metrics endpoint: $ExporterUrl"
    }
}
catch {
    Write-Error "[FAIL] Cannot reach windows_exporter at $ExporterUrl. Verify the service and TCP 9182."
}

try {
    $response = Invoke-WebRequest -Uri $PrometheusUrl -UseBasicParsing -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "[OK] Prometheus readiness endpoint: $PrometheusUrl"
    }
}
catch {
    Write-Warning "[INFO] Prometheus readiness check failed. Run this check from a machine that can reach the Prometheus container."
}

Write-Host ""
Write-Host "Next checks:"
Write-Host "1. Open the exporter metrics page."
Write-Host "2. Check Prometheus Status > Targets."
Write-Host "3. Open the Grafana Windows Monitoring dashboard."
