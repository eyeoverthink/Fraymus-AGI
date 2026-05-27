$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8080
$url = "http://localhost:$port/fraymus_cybersecurity_demo.html"

$listener = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $listener) {
    Start-Process -FilePath python `
        -ArgumentList '-m', 'http.server', "$port", '--bind', '127.0.0.1' `
        -WorkingDirectory $root `
        -WindowStyle Hidden
    Start-Sleep -Seconds 1
}

try {
    Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 5 | Out-Null
} catch {
    throw "FRAYMUS localhost server did not respond at $url. $($_.Exception.Message)"
}

$cacheBustedUrl = "${url}?v=$(Get-Date -Format 'yyyyMMddHHmmss')"
Start-Process -FilePath "explorer.exe" -ArgumentList $cacheBustedUrl
Write-Host "FRAYMUS SFA opened at $cacheBustedUrl"
Write-Host "Use this localhost URL for live Ollama access. file:// pages are rejected by Ollama CORS as Origin:null."
